import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'carbon_calculate_page.dart';



class ElephantPage extends StatefulWidget{
  ElephantPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ElephantPage createState() => _ElephantPage();
}

class _ElephantPage extends State<ElephantPage> {
  int selectedIndex = -1;
  MapShapeSource forestElephantMapShapes;
  MapZoomPanBehavior _zoomPanBehavior;
  List<MapModel> models;
  List<DeathData> chartData;


  @override
  void initState() {
    models = [
      MapModel("Gabon", 416, 268), //
      MapModel("Democratic Republic of the Congo", 1537, 1379), //
      MapModel("Republic of Congo", 674, 439), //
      MapModel("Cameroon", 108, 54), //
      MapModel("Central African Republic", 353, 239), //
      MapModel("Côte d'Ivoire", 27, 14), //
      MapModel("Liberia", 5, 5), //
      MapModel("Ghana", 51, 27), //
      MapModel("Chad", 457, 387), //
    ];

    chartData = [
      DeathData("Gabon",1, 1996, 416, 268), //
      DeathData("Gabon",1,1997, 1537, 1379), //
      DeathData("Gabon",1,1998, 674, 439), //
      DeathData("Gabon",1,1999, 108, 54), //
      DeathData("Gabon",1,2000, 353, 239), //
      DeathData("Gabon",1,2001, 27, 14), //
      DeathData("Gabon",1,2002, 5, 5), //
      DeathData("Gabon",1,2003, 51, 27), //
      DeathData("Gabon",1,2004, 457, 387), //
    ];


    forestElephantMapShapes = MapShapeSource.asset(
      'assets/map/africa.geojson',
      shapeDataField: 'name_long',
      dataCount: models.length,
      dataLabelMapper: (int index) => models[index].country,
      primaryValueMapper: (int index) => models[index].country,
      shapeColorValueMapper: (int index) =>
      100 * (models[index].poachingDeaths / models[index].totalDeaths),
      shapeColorMappers: [
        MapColorMapper(
          from: 0,
          to: 50,
          color: Colors.green,
          minOpacity: 0.2,
          maxOpacity: 0.4,
        ),
        MapColorMapper(
          from: 51,
          to: 100,
          color: Colors.red,
          minOpacity: 0.2,
          maxOpacity: 0.8,
        ),
      ],
    );
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
        drawer: Container(
          width: 215.0,
          child: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  Container(
                    height: 110.0,
                    child: DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0, bottom: 0.0),
                            child: ClipOval(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/');
                                },
                                child: Image(
                                  width: 55,
                                  height: 55,
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/images/highreslogo.png'),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                            child: Text(
                              'AllEars',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.text_snippet_outlined,
                        color: Colors.tealAccent[400]),
                    title: Text('About Us'),
                    onTap: () {
                      Navigator.pushNamed(context, '/second');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.calculate_outlined, color: Colors.red),
                    title: Text('Carbon Calculator'),
                    onTap: () {
                      Navigator.pushNamed(context, '/third');
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.monetization_on_outlined,
                        color: Colors.amber[600]),
                    title: Text('Donate'),
                    onTap: () {
                      Navigator.pushNamed(context, '/fourth');
                    },
                  ),
                  Container(
                      child: ListTile(
                        leading: Icon(Icons.map_outlined, color: Colors.green),
                        title: Text('Elephant Map'),
                        onTap: () {
                          Navigator.pushNamed(context, '/fifth');
                        },
                      ),
                      decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: Colors.black12)))),
                  ListTile(
                    title: Text('FAQ'),
                    onTap: () {
                      Navigator.pushNamed(context, '/sixth');
                    },
                  ),
                  ListTile(
                    title: Text('Write a Review'),
                    onTap: () {
                      Navigator.pushNamed(context, '/');
                    },
                  ),
                ],
              )),
        ),
        body: LayoutBuilder(builder: (ctx, constraints) {
          return ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(mainPading),
              children: [
                Container(
                  height: constraints.maxHeight - mainPading * 2,
                  child: SfMapsTheme(
                    data: SfMapsThemeData(
                      dataLabelTextStyle: TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Times'
                      ),
                    ),
                    child: SfMaps(
                      layers: [
                        MapTileLayer(
                          urlTemplate:
                          "https://api.mapbox.com/styles/v1/mapbox/light-v10/tiles/{z}/{x}/{y}?access_token=" +
                              MAPBOX_TOKEN,
                          zoomPanBehavior: _zoomPanBehavior,
                          sublayers: [],
                        ),
                        MapShapeLayer(
                          source: forestElephantMapShapes,
                          legend: MapLegend(MapElement.shape),
                          showDataLabels: true,
                          dataLabelSettings: MapDataLabelSettings(
                            overflowMode: MapLabelOverflow.ellipsis,
                          ),
                          zoomPanBehavior: _zoomPanBehavior,
                          onSelectionChanged: (index){
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          selectedIndex: selectedIndex,
                          shapeTooltipBuilder: (BuildContext ctx, int index) {
                            return Container(
                              width: 300,
                              height: 150,
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Total elephant deaths: ${models[index].totalDeaths}",
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Elephants killed by poaching: ${models[index].poachingDeaths}",
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                          "Percentage of elephants poached ${(100 * (models[index].poachingDeaths / models[index].totalDeaths)).toStringAsFixed(2)}%"),
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                if (selectedIndex >= 0)
                  Container(
                      height: constraints.maxHeight - mainPading * 2,
                      child: SfCartesianChart(
                        //Chart Title
                          title: ChartTitle(text: "${models[selectedIndex].country}'s Elephant poaching data"),
                          // enable legend
                          // legend: Legend(isVisible: true),
                          // Enable tooltip
                          tooltipBehavior: TooltipBehavior(enable: true),
                          primaryYAxis: NumericAxis(),
                          primaryXAxis: CategoryAxis(),
                          legend: Legend(
                              isVisible: true,
                              title:LegendTitle(
                                  text:"Year",
                                  textStyle: ChartTextStyle(
                                      color: Colors.lightBlue,
                                      fontSize: 15,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w900
                                  )
                              )
                          ),
                          series: <ChartSeries>[
                            LineSeries<DeathData, int>(
                              dataSource: chartData,
                              //xValueMapper: (DeathData illegalCarcasses, _) => chartData[selectedIndex].year,
                              //yValueMapper: (DeathData illegalCarcasses, _) => chartData[selectedIndex].illegalCarcasses,
                              xValueMapper: (DeathData illegalCarcasses, _) => illegalCarcasses.year,
                              yValueMapper: (DeathData illegalCarcasses, _) => illegalCarcasses.illegalCarcasses,
                            )
                          ]

                      )

                  ),
              ]
          );
        }
        )
    );
  }
}


class MapModel {
  final String country;
  final int totalDeaths;
  final int poachingDeaths;

  const MapModel(this.country, this.totalDeaths, this.poachingDeaths);
}

class DeathData {
  final String countryName;
  final int countryCode;
  final int year;
  final int natureCarcasses;
  final int illegalCarcasses;

  const DeathData(this.countryName, this.countryCode, this.year, this.natureCarcasses, this.illegalCarcasses);
}
