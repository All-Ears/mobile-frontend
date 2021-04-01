import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'app_drawer.dart';
import 'package:dropdown_search/dropdown_search.dart';

const MAPBOX_TOKEN =
    "pk.eyJ1Ijoid2VpbmJlcmdlcmphcmVkIiwiYSI6ImNraTJlZ3JsMzA5bWwycW1pbWp5OHAzd2sifQ.8kHj1dSkSP7DXJOAFhnL8w";

final startPointController = TextEditingController();
final endPointController = TextEditingController();

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
  //MapShapeSource worldmap;
  //String userInput;
  double st_latitude = 0.0;
  double st_longitude = 0.0;
  var st_name;

  /* // layover
  double st_latitude = 0.0;
  double st_longitude = 0.0;
  var st_name;
  */

  double nd_latitude = 0.0;
  double nd_longitude = 0.0;
  var nd_name;
  //int selectedIndex;
  double _opacity = 0.0;

  final _formKey = GlobalKey<FormState>();
  //final _selectedIataCode = GlobalKey<DropdownSearchState<String>>();

  @override
  void initState() {
    line = [
      LineModel(MapLatLng(st_latitude, st_longitude),
          MapLatLng(nd_latitude, nd_longitude)),
    ];

    _zoomPanBehavior = MapZoomPanBehavior(
      enablePinching: true,
      focalLatLng: MapLatLng(0, 0),
      zoomLevel: 0,
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
  void dispose() {
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
      drawer: AppDrawer(),
      body: LayoutBuilder(builder: (ctx, constraints) {
        return Container(
          color: Colors.white,
          child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(mainPading),
              children: [
                Container(
                  height: constraints.maxHeight / 1.5,
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
                                    dashArray: [8, 4, 3, 4],
                                  );
                                },
                              ).toSet(),
                              color: Colors.blueAccent,
                              animation: animation,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        ///.///////////////////////////////////////.///
                        /// DISCLAIMER: INPUTS MUST BE CAPITALIZED! ///
                        /// ISSUES: Some IATA codes doesn't work    ///
                        /// due to the online airport API           ///
                        ///.///////////////////////////////////////.///
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: DropdownSearch<AirCode>(
                              searchBoxController: startPointController,
                              validator: (v) =>
                                  v == null ? "Required field" : null,
                              showSearchBox: true,
                              showClearButton: true,
                              mode: Mode.DIALOG,
                              label: "Origin airport",
                              onFind: (String filter) => getData(filter),
                              isFilteredOnline: true,
                              filterFn: (user, filter) =>
                                  user.filterByIata(filter),
                              onChanged: (AirCode data) {
                                setState(() {
                                  startPointController.text = data.iataCode;
                                });
                              }),
                        ),
                        // Layover? Maybe?
                        /*
                        DropdownSearch<AirCode>(
                            searchBoxController: startPointController,
                            //validator: (v) => v == null ? "Required field" : null,
                            showSearchBox: true,
                            showClearButton: true,
                            mode: Mode.DIALOG,
                            label: "Add a layover",
                            onFind: (String filter) => getData(filter),
                            isFilteredOnline: true,
                            filterFn: (user, filter) => user.filterByIata(filter),
                            onChanged: (AirCode data) {
                              setState(() {
                                startPointController.text = data.iataCode;
                              });
                            }
                        ),
                        */

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: DropdownSearch<AirCode>(
                              searchBoxController: endPointController,
                              validator: (v) =>
                                  v == null ? "Required field" : null,
                              showSearchBox: true,
                              showClearButton: true,
                              hint: "Select a location",
                              mode: Mode.DIALOG,
                              label: "Destination airport",
                              onFind: (String filter) => getData(filter),
                              isFilteredOnline: true,
                              filterFn: (user, filter) =>
                                  user.filterByIata(filter),
                              onChanged: (AirCode data) {
                                setState(() {
                                  endPointController.text = data.iataCode;
                                });
                              }),
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: ElevatedButton(
                              child: Text("Calculate"),
                              onPressed: () {
                                //print(startPointController.text);
                                //print(endPointController.text);
                                if ((_formKey.currentState.validate())) {
                                  get_airport_info(startPointController.text,
                                          endPointController.text)
                                      .then((_) {
                                    setState(() {
                                      /// Form Line
                                      line = [
                                        LineModel(
                                            MapLatLng(
                                                st_latitude, st_longitude),
                                            MapLatLng(
                                                nd_latitude, nd_longitude)),
                                      ];

                                      /// Pan camera based on midpoint
                                      _zoomPanBehavior.focalLatLng = MapLatLng(
                                          (st_latitude + nd_latitude) / 2,
                                          (st_longitude + nd_longitude) / 2);

                                      /// Zoom values based on distance
                                      var distance = calculateLngLat(
                                          line[0].from, line[0].to);
                                      if (distance >= 10000) {
                                        _zoomPanBehavior.zoomLevel = 1;
                                      } else if (distance <= 9999 &&
                                          distance >= 8000) {
                                        _zoomPanBehavior.zoomLevel = 2;
                                      } else if (distance <= 7999 &&
                                          distance >= 5000) {
                                        _zoomPanBehavior.zoomLevel = 2.5;
                                      } else if (distance <= 4999 &&
                                          distance >= 3000) {
                                        _zoomPanBehavior.zoomLevel = 3;
                                      } else if (distance <= 2999 &&
                                          distance >= 1000) {
                                        _zoomPanBehavior.zoomLevel = 4;
                                      } else if (distance <= 999 &&
                                          distance >= 500)
                                        _zoomPanBehavior.zoomLevel = 5;
                                      else
                                        _zoomPanBehavior.zoomLevel = 8;
                                    });
                                  });
                                }
                              },
                            ))
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: Colors.black54,
                  thickness: 1.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  color: Colors.white,
                  height: 250,
                  width: 400,
                  child: Opacity(
                    opacity: _opacity,
                    child: Table(
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      border: TableBorder.all(),
                      children: <TableRow>[
                        TableRow(
                          children: <Widget>[
                            Container(
                              decoration:
                                  BoxDecoration(color: Colors.tealAccent[100]),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 15.0),
                                child: Text('Airports',
                                    textAlign: TextAlign.center),
                              ),
                            ),
                            Container(
                              decoration:
                                  BoxDecoration(color: Colors.tealAccent),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Text('Distance',
                                    textAlign: TextAlign.center),
                              ),
                            ),
                            Container(
                              decoration:
                                  BoxDecoration(color: Colors.tealAccent[100]),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text('Total Carbon Emitted',
                                    textAlign: TextAlign.center),
                              ),
                            ),
                            Container(
                              decoration:
                                  BoxDecoration(color: Colors.tealAccent),
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text('Suggested Donation',
                                    textAlign: TextAlign.center),
                              ),
                            )
                          ],
                        ),
                        TableRow(children: [
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(
                                '$st_name and $nd_name',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(
                                  '${calculateLngLat(line[0].from, line[0].to)} km',
                                  textAlign: TextAlign.center),
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(
                                  '${(calculateLngLat(line[0].from, line[0].to) * (12 / 44) * 0.0491).round()} kg',
                                  textAlign: TextAlign.center),
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(
                                  '${(calculateLngLat(line[0].from, line[0].to) * (12 / 44) * 0.0491 * .1).ceil()} USD',
                                  textAlign: TextAlign.center),
                            ),
                          ),
                        ]),
                      ],
                    ),
                  ),
                )
              ]),
        );
      }),
    );
  }

  Future<List<AirCode>> getData(filter) async {
    var response = await DefaultAssetBundle.of(context)
        .loadString("assets/map/airports.json");
    if (response != null) {
      var parse_body = jsonDecode(response);
      //print(parse_body);
      return List<AirCode>.from(parse_body.map((x) => AirCode.fromJson(x)));
    } else {
      throw Exception('Failed to load the Json file');
    }
  }

  Future<void> get_airport_info(String startCode, String endCode) async {
    var response_st = await DefaultAssetBundle.of(context)
        .loadString("assets/map/airports.json");
    var response_nd = await DefaultAssetBundle.of(context)
        .loadString("assets/map/airports.json");

    var parsed_body_st = jsonDecode(response_st);
    var parsed_body_nd = jsonDecode(response_nd);
    //print(parsed_body_st[0]['iataCode']);
    //print(parsed_body_st.length);

    int index_st = 0;
    int index_nd = 0;
    for (int i = 0; i < parsed_body_st.length; i++) {
      if (parsed_body_st[i]['iataCode'] == startCode) {
        index_st = i;
      }
      if (parsed_body_nd[i]['iataCode'] == endCode) {
        index_nd = i;
      }
    }
    print(index_st);
    var iata_st = parsed_body_st[index_st]['iataCode'];
    var iata_nd = parsed_body_nd[index_nd]['iataCode'];
    print(iata_st);
    print(iata_nd);

    var airport_uri_st =
        Uri.https('airport-info.p.rapidapi.com', '/airport', {'iata': iata_st});
    var airPortLocation_st = await http.get(airport_uri_st, headers: {
      "x-rapidapi-key": "1d0ea57848mshedfd4d93a4c05d9p1fee9fjsn2ebcd1d49bab",
      "x-rapidapi-host": "airport-info.p.rapidapi.com",
      "useQueryString": 'true'
    });

    var airport_uri_nd =
        Uri.https('airport-info.p.rapidapi.com', '/airport', {'iata': iata_nd});
    var airPortLocation_nd = await http.get(airport_uri_nd, headers: {
      "x-rapidapi-key": "1d0ea57848mshedfd4d93a4c05d9p1fee9fjsn2ebcd1d49bab",
      "x-rapidapi-host": "airport-info.p.rapidapi.com",
      "useQueryString": 'true'
    });

    print(airPortLocation_st.body);
    print(airPortLocation_nd.body);

    var parse_body_st = jsonDecode(airPortLocation_st.body);
    var parse_body_nd = jsonDecode(airPortLocation_nd.body);

    print(parse_body_st['latitude']);
    print(parse_body_st['longitude']);

    print(parse_body_nd['latitude']);
    print(parse_body_nd['longitude']);

    setState(() {
      st_latitude = parse_body_st['latitude'];
      st_longitude = parse_body_st['longitude'];
      st_name = parse_body_st['name'];

      nd_latitude = parse_body_nd['latitude'];
      nd_longitude = parse_body_nd['longitude'];
      nd_name = parse_body_nd['name'];

      _opacity = 1.0;
    });
  }
}

class AirCode {
  final String city;
  final String location;
  final String iataCode;

  AirCode({this.city, this.location, this.iataCode});

  factory AirCode.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return AirCode(
      city: json["city"],
      location: json["location"],
      iataCode: json["iataCode"],
    );
  }

  static List<AirCode> fromJsonList(List list) {
    if (list == null) return null;
    return list.map((item) => AirCode.fromJson(item)).toList();
  }

  ///this method will prevent the override of toString
  String userAsString() {
    return '${this.location} (${this.iataCode}) - ${this.city}';
  }

  ///this method will prevent the override of toString
  bool filterByIata(String filter) {
    return this.iataCode.toString().startsWith(filter) ||
        this.location.toString().startsWith(filter) ||
        this.city.toString().startsWith(filter) ||
        this.iataCode.toString().toLowerCase().startsWith(filter) ||
        this.location.toString().toLowerCase().startsWith(filter) ||
        this.city.toString().toLowerCase().startsWith(filter);
  }

  ///custom comparing function to check if two users are equal
  bool isEqual(AirCode model) {
    return this.iataCode == model.iataCode;
  }

  @override
  String toString() => userAsString();
}

bool equalsIgnoreCase(String string1, String string2) {
  return string1?.toLowerCase() == string2?.toLowerCase();
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
