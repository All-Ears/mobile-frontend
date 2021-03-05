import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

const MAPBOX_TOKEN =
    "pk.eyJ1Ijoid2VpbmJlcmdlcmphcmVkIiwiYSI6ImNraTJlZ3JsMzA5bWwycW1pbWp5OHAzd2sifQ.8kHj1dSkSP7DXJOAFhnL8w";

class CarbonCalculatePage extends StatefulWidget {
  CarbonCalculatePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CarbonCalculatePage createState() => _CarbonCalculatePage();
}

class _CarbonCalculatePage extends State<CarbonCalculatePage>
    with TickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;
  MapZoomPanBehavior _zoomPanBehavior;
  List<LineModel> line;
  MapShapeSource worldmap;
  String userInput;

  @override
  void initState() {
    line = [
      LineModel(MapLatLng(28.6139, 77.2090), MapLatLng(39.9042, 116.4074)),
      LineModel(MapLatLng(28.7041, 77.1025), MapLatLng(31.2304, 121.4737)),
      LineModel(MapLatLng(28.7041, 77.1025), MapLatLng(23.1291, 113.2644)),
      LineModel(MapLatLng(28.7041, 77.1025), MapLatLng(22.3193, 114.1694)),
      LineModel(MapLatLng(19.0760, 72.8777), MapLatLng(22.3193, 114.1694)),
      LineModel(MapLatLng(22.3193, 114.1694), MapLatLng(13.0827, 80.2707)),
    ];

    _zoomPanBehavior = MapZoomPanBehavior(
      focalLatLng: MapLatLng(22.9734, 90.6569),
      zoomLevel: 3,
    );

    animationController = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    );

    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    );
    animationController.forward(from: 0);
    super.initState();
  }

  @override
  void dispos() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const mainPading = 14.0;
    return Scaffold(
        appBar: AppBar(
          title: Text('Carbon Calculator'),
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
                        padding:
                            const EdgeInsets.only(right: 10.0, bottom: 0.0),
                        child: ClipOval(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/');
                            },
                            child: Image(
                              width: 55,
                              height: 55,
                              fit: BoxFit.cover,
                              image:
                                  AssetImage('assets/images/highreslogo.png'),
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
                      border:
                          Border(bottom: BorderSide(color: Colors.black12)))),
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
                          fontFamily: 'Times'),
                    ),
                    child: SfMaps(
                      layers: [
                        MapTileLayer(
                          urlTemplate:
                              "https://api.mapbox.com/styles/v1/mapbox/light-v10/tiles/{z}/{x}/{y}?access_token=" +
                                  MAPBOX_TOKEN,
                          zoomPanBehavior: _zoomPanBehavior,
                          sublayers: [
                            MapArcLayer(
                              arcs: List<MapArc>.generate(
                                line.length,
                                (int index) {
                                  return MapArc(
                                    from: line[index].from,
                                    to: line[index].to,
                                    heightFactor: -0.2,
                                    dashArray: [8, 4, 2, 4],
                                  );
                                },
                              ).toSet(),
                              color: Colors.lightBlue,
                              animation: animation,
                              tooltipBuilder:
                                  (BuildContext context, int index) {
                                return Container(
                                  padding: EdgeInsets.only(left: 5, top: 5),
                                  height: 40,
                                  width: 500,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                              'The distance between two points'),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                              'Distance  : ${calculateLngLat(line[index].from, line[index].to)} km'),
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                    height: constraints.maxHeight - mainPading * 2,
                    width: constraints.maxWidth - mainPading * 2,
                    child: Column(children: [
                      Row(children: [
                        Text("Start point:   "),
                        Expanded(child: TextField(onSubmitted: (string) {get_airport_laglng(string);}))
                      ]),
                      Row(children: [
                        Text("End point:   "),
                        Expanded(child: TextField(onSubmitted: (string) {
                          setState(() {
                            userInput = string;
                          });
                        }))
                      ]),
                    ]))
              ]);
        }));
  }
}

Future<void> get_airport_laglng(String searchString) async {
  var skyScannerUri = Uri.https(
      'skyscanner-skyscanner-flight-search-v1.p.rapidapi.com',
      '/apiservices/autosuggest/v1.0/UK/GBP/en-GB/',
      {'query': searchString});
  var skyScannerResponse = await http.get(skyScannerUri, headers: {
    "x-rapidapi-key": "1d0ea57848mshedfd4d93a4c05d9p1fee9fjsn2ebcd1d49bab",
    "x-rapidapi-host": "skyscanner-skyscanner-flight-search-v1.p.rapidapi.com",
    "useQueryString": 'true'
  });
  print(skyScannerResponse.body);
  var parsed_body = jsonDecode(skyScannerResponse.body);
  var place_id = parsed_body['Places'][0]['PlaceId'];
  print(place_id);
  var iata_code = place_id.substring(0, place_id.length - 4);

  var airport_uri =
      Uri.https('airport-info.p.rapidapi.com', '/airport', {'iata': iata_code});
  var airPortLocation = await http.get(airport_uri, headers: {
    "x-rapidapi-key": "1d0ea57848mshedfd4d93a4c05d9p1fee9fjsn2ebcd1d49bab",
    "x-rapidapi-host": "airport-info.p.rapidapi.com",
    "useQueryString": 'true'
  });

  print(airPortLocation.body);
  var parse_body = jsonDecode(airPortLocation.body);
  print(parse_body['latitude']);
  print(parse_body['longitude']);
}

class LineModel {
  const LineModel(this.from, this.to);
  final MapLatLng from;
  final MapLatLng to;
}

int calculateLngLat(MapLatLng PointA, MapLatLng PointB) {
  var p = 0.017453292519943295;
  var c = cos;
  var a = 0.5 -
      c((PointB.latitude - PointA.latitude) * p) / 2 +
      c(PointA.latitude * p) *
          c(PointB.latitude * p) *
          (1 - c((PointB.longitude - PointA.longitude) * p)) /
          2;
  return (12742 * asin(sqrt(a))).round();
}
