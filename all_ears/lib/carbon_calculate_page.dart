import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'app_drawer.dart';

const MAPBOX_TOKEN =
    "pk.eyJ1Ijoid2VpbmJlcmdlcmphcmVkIiwiYSI6ImNraTJlZ3JsMzA5bWwycW1pbWp5OHAzd2sifQ.8kHj1dSkSP7DXJOAFhnL8w";

final startPointController = TextEditingController();
final endPointController = TextEditingController();

final _formKey = GlobalKey<FormState>();

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
  double st_latitude = 0.0;
  double st_longitude = 0.0;
  var st_name;

  double nd_latitude = 0.0;
  double nd_longitude = 0.0;
  var nd_name;

  @override
  void initState() {
    line = [
      LineModel(MapLatLng(st_latitude, st_longitude),
          MapLatLng(nd_latitude, nd_longitude)),
    ];

    _zoomPanBehavior = MapZoomPanBehavior(
      focalLatLng: MapLatLng(0, 0),
      zoomLevel: 1,
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

  var text = "Calculate";

  @override
  Widget build(BuildContext context) {
    const mainPading = 14.0;

    return Scaffold(
      appBar: AppBar(
        title: Text('Carbon Calculator'),
      ),
      drawer: AppDrawer(),
      body: LayoutBuilder(builder: (ctx, constraints) {
        return ListView(
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
                                  dashArray: [8, 4, 2, 4],
                                );
                              },
                            ).toSet(),
                            color: Colors.lightBlue,
                            animation: animation,
                            tooltipBuilder: (BuildContext context, int index) {
                              return Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                color: Colors.white,
                                height: 145,
                                width: 350,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                            'The distance between \n$st_name and \n$nd_name'),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Row(
                                        children: [
                                          Text(
                                              'Distance : ${calculateLngLat(line[index].from, line[index].to)} km \n'
                                              'Total Carbon Emitted : ${(calculateLngLat(line[index].from, line[index].to) * (12 / 44) * 0.29).round()} kg \n'
                                              'Suggested Donation : ${(calculateLngLat(line[index].from, line[index].to) * (12 / 44) * 0.29).round() / 1000} usd \n'),
                                        ],
                                      ),
                                    ),
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
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: startPointController,
                      inputFormatters: [toUpperCase()],
                      decoration: InputDecoration(
                          labelText: 'Starting Airport',
                          hintText: 'Enter a location',
                          hintStyle:
                              TextStyle(fontSize: 12, color: Colors.pink)),
                      validator: (string) {
                        if (string.isEmpty) {
                          return "This field is required";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: endPointController,
                      inputFormatters: [toUpperCase()],
                      decoration: InputDecoration(
                          labelText: 'Ending Airport',
                          hintText: 'Enter a location',
                          hintStyle:
                              TextStyle(fontSize: 12, color: Colors.pink)),
                      validator: (string) {
                        if (string.isEmpty) {
                          return "This field is required";
                        }
                        return null;
                      },
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                          child: Text("$text"),
                          onPressed: () {
                            //changeString();
                            print(startPointController.text);
                            print(endPointController.text);
                            if ((_formKey.currentState.validate())) {
                              get_airport_info(startPointController.text,
                                      endPointController.text)
                                  .then((_) {
                                setState(() {
                                  line = [
                                    LineModel(
                                        MapLatLng(st_latitude, st_longitude),
                                        MapLatLng(nd_latitude, nd_longitude)),
                                  ];
                                });
                              });
                            }
                          },
                        ))
                  ],
                ),
              )
            ]);
      }),
    );
  }

  Future<void> get_airport_info(String startCode, String endCode) async {


    /*
    var skyScannerUri_st = Uri.https(
        'skyscanner-skyscanner-flight-search-v1.p.rapidapi.com',
        '/apiservices/autosuggest/v1.0/UK/GBP/en-GB/',
        {'query': startCode});
    var skyScannerResponse_st = await http.get(skyScannerUri_st, headers: {
      "x-rapidapi-key": "1d0ea57848mshedfd4d93a4c05d9p1fee9fjsn2ebcd1d49bab",
      "x-rapidapi-host":
          "skyscanner-skyscanner-flight-search-v1.p.rapidapi.com",
      "useQueryString": 'true'
    });

    var skyScannerUri_nd = Uri.https(
        'skyscanner-skyscanner-flight-search-v1.p.rapidapi.com',
        '/apiservices/autosuggest/v1.0/UK/GBP/en-GB/',
        {'query': endCode});
    var skyScannerResponse_nd = await http.get(skyScannerUri_nd, headers: {
      "x-rapidapi-key": "1d0ea57848mshedfd4d93a4c05d9p1fee9fjsn2ebcd1d49bab",
      "x-rapidapi-host":
          "skyscanner-skyscanner-flight-search-v1.p.rapidapi.com",
      "useQueryString": 'true'
    });

    //print(skyScannerResponse.body);
    var parsed_body_st = jsonDecode(skyScannerResponse_st.body);
    var parsed_body_nd = jsonDecode(skyScannerResponse_nd.body);

    var place_id_st = parsed_body_st['Places'][0]['PlaceId'];
    var place_id_nd = parsed_body_nd['Places'][0]['PlaceId'];

    //print(place_id);
    var iata_code_st = place_id_st.substring(0, place_id_st.length - 4);
    var iata_code_nd = place_id_nd.substring(0, place_id_nd.length - 4);
*/

    var airport_uri_st = Uri.https(
        'airport-info.p.rapidapi.com', '/airport', {'iata': iata_code_st});
    var airPortLocation_st = await http.get(airport_uri_st, headers: {
      "x-rapidapi-key": "1d0ea57848mshedfd4d93a4c05d9p1fee9fjsn2ebcd1d49bab",
      "x-rapidapi-host": "airport-info.p.rapidapi.com",
      "useQueryString": 'true'
    });

    var airport_uri_nd = Uri.https(
        'airport-info.p.rapidapi.com', '/airport', {'iata': iata_code_nd});
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
    });
  }
}

class toUpperCase extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return newValue.copyWith(text: newValue.text.toUpperCase());
  }
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
