import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'carbon_calculate_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dart:math';
import 'app_drawer.dart';

class ElephantPage extends StatefulWidget {
  ElephantPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ElephantPage createState() => _ElephantPage();
}

class _ElephantPage extends State<ElephantPage> {
  int selectedIndex = -1;
  MapShapeSource forestElephantMapShapes;
  MapZoomPanBehavior _zoomPanBehavior;
  List<CountryRecord> models;
  Future<List<CountryRecord>> countryInfo;

  @override
  void initState() {
    super.initState();
    countryInfo = fetchBackend();

    _zoomPanBehavior = MapZoomPanBehavior(
      focalLatLng: MapLatLng(0.228021, 15.827659),
      zoomLevel: 4,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const mainPading = 14.0;
    return Scaffold(
        appBar: AppBar(
          title: Text('Elephant Map'),
        ),
        drawer: AppDrawer(),
        body: LayoutBuilder(builder: (ctx, constraints) {
          return ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(mainPading),
              children: [
                Container(
                  height: constraints.maxHeight - mainPading * 2,
                  child: SfMapsTheme(
                    data: SfMapsThemeData(
                      layerStrokeColor: Colors.white,
                      layerStrokeWidth: 2,
                      dataLabelTextStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Times'),
                    ),
                    child: FutureBuilder<List<CountryRecord>>(
                        future: countryInfo,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            models = getLatestDataPerCountry(snapshot.data);
                            var maxPoaching = models
                                    .map((x) => x.illegalCarcasses)
                                    .reduce(max),
                                forestElephantMapShapes = MapShapeSource.asset(
                                  'assets/map/africa.geojson',
                                  shapeDataField: 'name',
                                  dataCount: models.length,
                                  dataLabelMapper: (int index) =>
                                      models[index].countryName,
                                  primaryValueMapper: (int index) =>
                                      models[index].countryName,
                                  shapeColorValueMapper: (int index) =>
                                      models[index].illegalCarcasses,
                                  shapeColorMappers: [
                                    MapColorMapper(
                                      from: 0,
                                      to: (maxPoaching * 0.25),
                                      color: Colors.blue,
                                      minOpacity: 0.2,
                                      maxOpacity: 0.4,
                                      text: '< 25%',
                                    ),
                                    MapColorMapper(
                                      from: ((maxPoaching * 0.25) + 1),
                                      to: (maxPoaching * 0.5),
                                      color: Colors.green,
                                      minOpacity: 0.2,
                                      maxOpacity: 0.4,
                                      text: '25% - 50%',
                                    ),
                                    MapColorMapper(
                                      from: (maxPoaching * 0.5) + 1,
                                      to: (maxPoaching * 0.75),
                                      color: Colors.deepOrangeAccent,
                                      minOpacity: 0.2,
                                      maxOpacity: 0.8,
                                      text: '50% - 75%',
                                    ),
                                    MapColorMapper(
                                      from: (maxPoaching * 0.75) + 1,
                                      to: maxPoaching.toDouble(),
                                      color: Colors.red,
                                      minOpacity: 0.2,
                                      maxOpacity: 0.8,
                                      text: '75% - 100%',
                                    )
                                  ],
                                );
                            return SfMaps(
                              layers: [
                                MapShapeLayer(
                                  source: forestElephantMapShapes,
                                  legend: MapLegend(MapElement.shape),
                                  showDataLabels: true,
                                  dataLabelSettings: MapDataLabelSettings(
                                    overflowMode: MapLabelOverflow.ellipsis,
                                  ),
                                  selectionSettings: MapSelectionSettings(
                                    strokeColor: Colors.white,
                                    strokeWidth: 2.0,
                                  ),
                                  zoomPanBehavior: _zoomPanBehavior,
                                  onSelectionChanged: (index) {
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                  },
                                  selectedIndex: selectedIndex,
                                  shapeTooltipBuilder:
                                      (BuildContext ctx, int index) {
                                    return Container(
                                      width: 300,
                                      height: 150,
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "Total elephant deaths: ${models[index].carcasses}",
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "Elephants killed by poaching: ${models[index].illegalCarcasses}",
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                  "Percentage of elephants poached ${(100 * (models[index].illegalCarcasses / models[index].carcasses)).toStringAsFixed(2)}%"),
                                            ],
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            );
                          } else if (snapshot.hasError) {
                            return Text("blablabla");
                          } else {
                            return Text('loading Data');
                          }
                        }),
                  ),
                ),
                if (selectedIndex >= 0)
                  Container(
                    height: constraints.maxHeight - mainPading * 2,

                    child: FutureBuilder(
                        future: countryInfo,
                        builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return SfCartesianChart(
                            //Chart Title
                            title: ChartTitle(
                                text:
                                    "${models[selectedIndex].countryName}'s Elephant poaching data"),
                            // enable legend
                            // legend: Legend(isVisible: true),
                            // Enable tooltip
                            tooltipBehavior: TooltipBehavior(enable: true),
                            primaryYAxis: NumericAxis(),
                            primaryXAxis: CategoryAxis(),
                            legend: Legend(
                                isVisible: true,
                                title: LegendTitle(
                                    text: "Year",
                                    textStyle: ChartTextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w900))),
                            series: <ChartSeries>[
                              LineSeries<CountryRecord, int>(
                                dataSource: snapshot.data.where((x) => x.countryName == models[selectedIndex].countryName).toList(),
                                xValueMapper: (CountryRecord x, _) => x.year,
                                yValueMapper: (CountryRecord y, _) =>
                                    y.illegalCarcasses,
                              )
                            ]);
                      } else if (snapshot.hasError) {
                        return Text("blablabla");
                      } else {
                        return Text('loading Data');
                      }
                    }),
                  )
              ]);
        }));
  }
}

class MapModel {
  final String country;
  final int totalDeaths;
  final int poachingDeaths;

  const MapModel(this.country, this.totalDeaths, this.poachingDeaths);
}

class CountryRecord {
  final String countryName;
  final String countryCode;
  final int year;
  final int carcasses;
  final int illegalCarcasses;

  CountryRecord(
      {this.countryName,
      this.countryCode,
      this.year,
      this.carcasses,
      this.illegalCarcasses});

  factory CountryRecord.fromJson(Map<String, dynamic> json) {
    return CountryRecord(
      countryName: json['countryName'],
      countryCode: json['countryCode'],
      year: json['year'],
      carcasses: json['carcasses'],
      illegalCarcasses: json['illegalCarcasses'],
    );
  }
}

Future<List<CountryRecord>> fetchBackend() async {
  final parse_countryrecord =
      await http.get('http://143.110.222.9/api/countryrecords');
  if (parse_countryrecord.statusCode == 200) {
    var parse_body = jsonDecode(parse_countryrecord.body);
    return List<CountryRecord>.from(
        parse_body.map((x) => CountryRecord.fromJson(x)));
  } else {
    throw Exception('Failed to load contryrecords');
  }
}

List<CountryRecord> getLatestDataPerCountry(List<CountryRecord> records) {
  Map<String, CountryRecord> latestRecords = new Map<String, CountryRecord>();
  for (var record in records) {
    if (latestRecords.containsKey(record.countryName)) {
      if (latestRecords[record.countryName].year < record.year)
        latestRecords[record.countryName] = record;
    } else {
      latestRecords[record.countryName] = record;
    }
  }
  return List<CountryRecord>.from(latestRecords.values);
}
