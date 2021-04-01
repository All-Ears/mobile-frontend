import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_core/theme.dart';
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
      focalLatLng: MapLatLng(0.10, 20),
      zoomLevel: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    const mainPading = 20.0;
    return Scaffold(
        appBar: AppBar(
          title: Text('Elephant Map'),
        ),
        drawer: AppDrawer(),
        body: LayoutBuilder(builder: (ctx, constraints) {
          return ListView(
              //scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              padding: EdgeInsets.all(mainPading),
              children: [
                Container(
                  height: constraints.maxHeight - mainPading * 16,
                  child: SfMapsTheme(
                    data: SfMapsThemeData(
                      layerStrokeColor: Colors.white,
                      layerStrokeWidth: 2,
                      dataLabelTextStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Times'),
                    ),
                    child: FutureBuilder<List<CountryRecord>>(
                        future: countryInfo,
                        builder: (ctx, snapshot) {
                          switch (snapshot.connectionState) {
                            // Uncompleted State
                            case ConnectionState.none:
                            case ConnectionState.waiting:
                              return Center(child: CircularProgressIndicator());
                              break;
                            default:
                              models = getLatestDataPerCountry(snapshot.data);
                              final maxPoaching = models
                                  .map((x) => x.illegalCarcasses)
                                  .reduce(max);
                              forestElephantMapShapes = MapShapeSource.asset(
                                'assets/map/africa-map.json',
                                shapeDataField: 'code',
                                dataCount: models.length,
                                dataLabelMapper: (int index) =>
                                    models[index].countryName,
                                primaryValueMapper: (int index) =>
                                    models[index].countryCode,
                                shapeColorValueMapper: (int index) =>
                                    models[index].illegalCarcasses,
                                shapeColorMappers: [
                                  MapColorMapper(
                                    from: 0,
                                    to: maxPoaching * 0.33,
                                    color: Colors.green,
                                    minOpacity: 0.2,
                                    maxOpacity: 0.8,
                                    text: '< 33%',
                                  ),
                                  MapColorMapper(
                                    from: (maxPoaching * 0.33) + 1,
                                    to: (maxPoaching * 0.66),
                                    color: Colors.orange,
                                    minOpacity: 0.2,
                                    maxOpacity: 0.8,
                                    text: '34% - 66%',
                                  ),
                                  MapColorMapper(
                                    from: (maxPoaching * 0.66) + 1,
                                    to: maxPoaching.toDouble(),
                                    color: Colors.red,
                                    minOpacity: 0.2,
                                    maxOpacity: 0.8,
                                    text: '66% - 100%',
                                  ),
                                ],
                              );
                              if (snapshot.hasData) {
                                return Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: SfMaps(
                                    layers: [
                                      MapShapeLayer(
                                          source: forestElephantMapShapes,
                                          legend: MapLegend(MapElement.shape),
                                          showDataLabels: true,
                                          dataLabelSettings:
                                              MapDataLabelSettings(
                                            overflowMode:
                                                MapLabelOverflow.ellipsis,
                                          ),
                                          selectionSettings:
                                              MapSelectionSettings(
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
                                          color: Colors.blueGrey,
                                          shapeTooltipBuilder: (ctx, snapshot) {
                                            if (selectedIndex == 0) {
                                              return Container(
                                                child: Icon(Icons
                                                    .airplanemode_inactive),
                                              );
                                            } else {
                                              return Container(
                                                child: Icon(
                                                    Icons.airplanemode_active),
                                              );
                                            }
                                          }),
                                    ],
                                  ),
                                );
                              } else if (snapshot.hasError) {
                                Padding(
                                  padding: EdgeInsets.only(top: 7),
                                  child: Text('Loading error...'),
                                );
                              } else {
                                Padding(
                                  padding: EdgeInsets.only(top: 7),
                                  child: Text('Awaiting result...'),
                                );
                              }
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                color: Colors.green,
                                child: Text("This would be a mistake"),
                              );
                          }
                        }),
                  ),
                ),
                if (selectedIndex >= 0)
                  Container(
                    height: 145,
                    width: 400,
                    child: FutureBuilder(
                        future: countryInfo,
                        builder: (ctx, snapshot) {
                          var percentage;
                          if (models[selectedIndex].carcasses == 0) {
                            percentage = 0;
                          } else {
                            percentage =
                                models[selectedIndex].illegalCarcasses /
                                    models[selectedIndex].carcasses;
                          }
                          if (snapshot.hasData) {
                            return Padding(
                              padding: const EdgeInsets.all(0),
                              child: Center(
                                child:
                                    Table(border: TableBorder.all(), children: [
                                  TableRow(children: [
                                    Text('Carcasses',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Text('illegalCarcasses',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Text('year',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Text('Percentage',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ]),
                                  TableRow(children: [
                                    Text('${models[selectedIndex].carcasses}'),
                                    Text(
                                        '${models[selectedIndex].illegalCarcasses}'),
                                    Text('${models[selectedIndex].year}'),
                                    Text(
                                        '${(percentage * 100).toStringAsFixed(2)}%'),
                                  ]),
                                ]),
                              ),
                            );
                          } else if (snapshot.hasError) {
                            print(snapshot.error);
                            return Text(
                                "Error loading elephant mortality data.");
                          } else {
                            return Text('awaiting result...');
                          }
                        }),
                  ),
                if (selectedIndex >= 0)
                  Container(
                    height: constraints.maxHeight * 0.68,
                    child: FutureBuilder(
                        future: countryInfo,
                        builder: (ctx, snapshot) {
                          if (snapshot.hasData) {
                            return SfCartesianChart(
                                //Chart Title
                                title: ChartTitle(
                                    text:
                                        "${models[selectedIndex].countryName}'s Recent Illegal Carcasses Data"),
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
                                        textStyle: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w900))),
                                series: <ChartSeries>[
                                  LineSeries<CountryRecord, int>(
                                    dataSource: snapshot.data
                                        .where((x) =>
                                            x.countryName ==
                                            models[selectedIndex].countryName)
                                        .toList(),
                                    name: 'Elephant Poatching Death Per Year',
                                    xValueMapper: (CountryRecord x, _) =>
                                        x.year,
                                    yValueMapper: (CountryRecord y, _) =>
                                        y.illegalCarcasses,
                                  )
                                ]);
                          } else if (snapshot.hasError) {
                            return Text("loading error...");
                          } else {
                            return Text('awaiting result...');
                          }
                        }),
                  )
              ]);
        }));
  }
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
  http.Response parse_countryrecord;
  try {
    parse_countryrecord =
        await http.get('https://elephantfootprint.org/api/countryrecords');
  } catch (StateError) {
    rethrow;
  }

  if (parse_countryrecord.statusCode == 200 &&
      parse_countryrecord.body != null) {
    var parse_body = jsonDecode(parse_countryrecord.body);
    return List<CountryRecord>.from(
        parse_body.map((x) => CountryRecord.fromJson(x)));
  } else {
    throw ('Failed to load countryrecords');
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
