import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import 'dart:async';
import 'app_drawer.dart';
import 'package:dropdown_search/dropdown_search.dart';

const MAPBOX_TOKEN =
    "pk.eyJ1Ijoid2VpbmJlcmdlcmphcmVkIiwiYSI6ImNraTJlZ3JsMzA5bWwycW1pbWp5OHAzd2sifQ.8kHj1dSkSP7DXJOAFhnL8w";
const AIRPORT_API_KEY = "1d0ea57848mshedfd4d93a4c05d9p1fee9fjsn2ebcd1d49bab";
const AIRPORT_API_DOMAIN = 'airport-info.p.rapidapi.com';

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
  List<LineModel> line = List<LineModel>.empty();
  //MapShapeSource worldmap;
  //String userInput;
  double startLatitude = 0.0;
  double startLongitude = 0.0;
  String startName;

  double endLatitude = 0.0;
  double endLongitude = 0.0;
  String endName;
  //int selectedIndex;
  double _opacity = 0.0;

  bool hasValidAirports() {
    return startLatitude != 0 &&
        endLatitude != 0 &&
        startLongitude != 0 &&
        endLongitude != 0 &&
        problemAirports.length == 0;
  }

  final _formKey = GlobalKey<FormState>();
  //final _selectedIataCode = GlobalKey<DropdownSearchState<String>>();

  @override
  void initState() {
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

  List<Map<String, String>> problemAirports = <Map<String, String>>[];

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const mainPading = 14.0;

    List<Widget> donationInfoSection = List<Widget>.empty();
    if (hasValidAirports()) {
      donationInfoSection = List<Widget>.from([
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          color: Colors.white,
          height: 250,
          width: 400,
          child: Opacity(
            opacity: _opacity,
            child: Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              border: TableBorder.all(),
              children: <TableRow>[
                TableRow(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(color: Colors.tealAccent[100]),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 15.0),
                        child: Text('Airports', textAlign: TextAlign.center),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(color: Colors.tealAccent),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text('Distance', textAlign: TextAlign.center),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(color: Colors.tealAccent[100]),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text('Total Carbon Emitted',
                            textAlign: TextAlign.center),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(color: Colors.tealAccent),
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
                        '$startName and $endName',
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
                          '${(calculateLngLat(line[0].from, line[0].to) * (12 / 44) * 0.0491).toStringAsFixed(2)} kg',
                          textAlign: TextAlign.center),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                          '\$${(((calculateLngLat(line[0].from, line[0].to) * (12 / 44) * 0.0491)) * 0.41).ceil()}', // leave /1000 and no reason
                          textAlign: TextAlign.center),
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ),
        Container(
            child: Text(
                "In lieu of the above donation amount you could donate \$25 to support a ranger for a day.")),
        Container(
            child: Text(
                "An African forest elephant would cause 400.00 kg of carbon to be sequestered per year by keeping the forests healthy.")),
        Container(
            child: Text(
                ' An African forest elephant would need to live for ${((calculateLngLat(line[0].from, line[0].to) * (12 / 44) * 49.1).round() / 400000).toStringAsFixed(2)} years to sequester that amount of carbon.'))
      ]);
    }
    List<Widget> errorSection =
        List.of(problemAirports.map((problemAirport) => Container(
                child: Text(
              "${problemAirport["location"]} does not have any location information available.",
              style: TextStyle(color: Colors.red),
            ))));
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
                          child: DropdownSearch<PartialAirportInfo>(
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
                              onChanged: (PartialAirportInfo data) {
                                setState(() {
                                  startPointController.text = data.iataCode;
                                });
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: DropdownSearch<PartialAirportInfo>(
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
                              onChanged: (PartialAirportInfo data) {
                                setState(() {
                                  endPointController.text = data?.iataCode;
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
                                  getAirportInfo(startPointController.text,
                                          endPointController.text)
                                      .then((_) {
                                    print(errorSection);
                                    if (hasValidAirports()) {
                                      setState(() {
                                        /// Form Line
                                        line = [
                                          LineModel(
                                              MapLatLng(startLatitude,
                                                  startLongitude),
                                              MapLatLng(
                                                  endLatitude, endLongitude)),
                                        ];

                                        /// Pan camera based on midpoint
                                        _zoomPanBehavior.focalLatLng =
                                            MapLatLng(
                                                (startLatitude + endLatitude) /
                                                    2,
                                                (startLongitude +
                                                        endLongitude) /
                                                    2);

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
                                    }
                                  });
                                }
                              },
                            ))
                      ],
                    ),
                  ),
                ),
                ...errorSection,
                Divider(
                  color: Colors.black54,
                  thickness: 1.0,
                ),
                ...donationInfoSection,
                Container(
                    child: Text(
                        "*Due to mapping limitations, the line drawn on the map may not be the actual flight path of the plane. Regardless, the distance calculated is the shortest distance between the two airports.")),
                Container(
                  child: new InkWell(
                      child: new Text(
                          "**Our carbon emmision values use methods from the UK National Energy Foundation's Carbon Calculator"), //text style stuff for "Carbon Calculator"
                      onTap: () =>
                          launch('http://www.carbon-calculator.org.uk/')),
                ),
              ]),
        );
      }),
    );
  }

  Future<List<PartialAirportInfo>> getData(filter) async {
    var response = await DefaultAssetBundle.of(context)
        .loadString("assets/map/airports.json");
    if (response != null) {
      var parsedBody = jsonDecode(response);
      //print(parse_body);
      return List<PartialAirportInfo>.from(
          parsedBody.map((x) => PartialAirportInfo.fromJson(x)));
    } else {
      throw Exception('Failed to load the Json file');
    }
  }

  Future<void> getAirportInfo(String startCode, String endCode) async {
    setState(() {
      problemAirports.clear();
    });
    var rawAirportCodes = await DefaultAssetBundle.of(context)
        .loadString("assets/map/airports.json");
    var airportInfos = jsonDecode(rawAirportCodes);

    Map<String, String> startAirport = null, endAirport = null;
    for (var airportInfo in airportInfos) {
      if (startAirport != null && endAirport != null) {
        break;
      }
      if (startAirport == null && airportInfo["iataCode"] == startCode) {
        startAirport = Map.from(airportInfo);
      }
      if (endAirport == null && airportInfo["iataCode"] == endCode) {
        endAirport = Map.from(airportInfo);
      }
    }

    var startAirportQueryUri = Uri.https(
        AIRPORT_API_DOMAIN, '/airport', {'iata': startAirport["iataCode"]});
    var startAirportQueryRespose =
        await http.get(startAirportQueryUri, headers: {
      "x-rapidapi-key": AIRPORT_API_KEY,
      "x-rapidapi-host": AIRPORT_API_DOMAIN,
      "useQueryString": 'true'
    });

    var endAirportQueryUri = Uri.https(
        AIRPORT_API_DOMAIN, '/airport', {'iata': endAirport["iataCode"]});
    var endAirportQueryResponse = await http.get(endAirportQueryUri, headers: {
      "x-rapidapi-key": AIRPORT_API_KEY,
      "x-rapidapi-host": AIRPORT_API_DOMAIN,
      "useQueryString": 'true'
    });

    var startResponseBody = jsonDecode(startAirportQueryRespose.body);
    var endResponseBody = jsonDecode(endAirportQueryResponse.body);

    setState(() {
      startLatitude = startResponseBody['latitude']?.toDouble() ?? 0;
      startLongitude = startResponseBody['longitude']?.toDouble() ?? 0;
      startName = startResponseBody['name'];
      if (startLatitude == 0 || startLongitude == 0) {
        problemAirports.add(startAirport);
      }

      endLatitude = endResponseBody['latitude'].toDouble() ?? 0;
      endLongitude = endResponseBody['longitude'].toDouble() ?? 0;
      endName = endResponseBody['name'];
      if (endLatitude == 0 || endLongitude == 0) {
        problemAirports.add(endAirport);
      }

      _opacity = 1.0;
    });
  }
}

class PartialAirportInfo {
  final String city;
  final String location;
  final String iataCode;

  PartialAirportInfo({this.city, this.location, this.iataCode});

  factory PartialAirportInfo.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return PartialAirportInfo(
      city: json["city"],
      location: json["location"],
      iataCode: json["iataCode"],
    );
  }

  static List<PartialAirportInfo> fromJsonList(List list) {
    if (list == null) return null;
    return list.map((item) => PartialAirportInfo.fromJson(item)).toList();
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
  bool isEqual(PartialAirportInfo model) {
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
