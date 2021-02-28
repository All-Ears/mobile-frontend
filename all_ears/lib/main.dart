// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'dart:math';

const MAPBOX_TOKEN =
    "pk.eyJ1Ijoid2VpbmJlcmdlcmphcmVkIiwiYSI6ImNraTJlZ3JsMzA5bWwycW1pbWp5OHAzd2sifQ.8kHj1dSkSP7DXJOAFhnL8w";

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => HomeRoute(),
      '/second': (context) => SecondRoute(),
      '/third': (context) => ThirdRoute(),
      '/fourth': (context) => FourthRoute(),
      '/fifth': (context) => FifthRoute(),
      '/sixth': (context) => SixthRoute(),
    },
  ));
}

class HomeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page',
            style: TextStyle(
              fontSize: 30,
            )),
        backgroundColor: Colors.lightBlueAccent,
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
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Center(
            child: Column(
              children: <Widget>[
                Text('Why should you care?', style: TextStyle(fontSize: 25)),
                RaisedButton(
                  child: Text('About',
                      style: TextStyle(
                        fontSize: 20,
                      )),
                  onPressed: () {
                    Navigator.pushNamed(context, '/second');
                  },
                ),
                Text('How much carbon do flights emit?',
                    style: TextStyle(fontSize: 25)),
                RaisedButton(
                  child: Text('Carbon Calculator',
                      style: TextStyle(
                        fontSize: 20,
                      )),
                  onPressed: () {
                    Navigator.pushNamed(context, '/third');
                  },
                ),
                Text('Want to help the forest elephants?',
                    style: TextStyle(fontSize: 25)),
                RaisedButton(
                  child: Text('Donate',
                      style: TextStyle(
                        fontSize: 20,
                      )),
                  onPressed: () {
                    Navigator.pushNamed(context, '/fourth');
                  },
                ),
                Text('Where are these elephants?', style: TextStyle(fontSize: 25)),
                RaisedButton(
                  child: Text('Elephant Map',
                      style: TextStyle(
                        fontSize: 20,
                      )),
                  onPressed: () {
                    Navigator.pushNamed(context, '/fifth');
                  },
                ),
              ],
            )),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "About Us",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          backgroundColor: Colors.lightGreen,
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
                    leading: Icon(
                      Icons.monetization_on_outlined,
                      color: Colors.amber[600],
                    ),
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
        body: DefaultTextStyle(
          style: Theme.of(context).textTheme.bodyText2,
          child: LayoutBuilder(
            builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        color: Colors.white,
                        height: 1000.0,
                        child: elephantInfo,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}

Widget elephantInfo = Container(
  padding: const EdgeInsets.all(32),
  child: Row(
    children: [
      Expanded(
        /*1*/
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*2*/
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                'About African Forest Elephants',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'Forest elephants are an elusive subspecies of African elephants and inhabit the densely wooded rainforests of west and central Africa. Their preference for dense forest habitat prohibits traditional counting methods such as visual identification. Their population is usually estimated through "dung counts"—an analysis on the ground of the density and distribution of the feces. \nForest elephants are smaller than savanna elephants, the other African elephant subspecies. Their ears are more oval-shaped ears and their tusks are straighter and point downward (the tusks of savanna elephants curve outwards). There are also differences in the size and shape of the skull and skeleton. Forest elephants are found most commonly in countries with relatively large blocks of dense forest such as Gabon, the Democratic Republic of Congo (DRC), Cameroon and Central African Republic in central Africa and Côte d’Ivoire, Liberia, and Ghana in west Africa.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text('\nAbout Megabiota Labs',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
            Text(
              'We study the interactions between forests and climate and how animals affect ecosystem function with a focus on tropical forests. Studying these relationships help us understand the way that forest elephants help draw down atmopheric carbon',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text('\nWhy You Should Donate',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
            Text(
              'You should donate beacause these beautiful creatures do amazing work at drawing down atmospheric carbon, creating cleaner air and taking down the level of green house gasses in the atmosphere. These elephants are often victims of illegal killings, called poaching, and researchers are seeing a drastic fall in their populations ',
              style: TextStyle(
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
      /*3*/
    ],
  ),
);

class ThirdRoute extends StatefulWidget {
  ThirdRoute({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ThirdRoute createState() => _ThirdRoute();
}

class _ThirdRoute extends State<ThirdRoute> with TickerProviderStateMixin {

  AnimationController animationController;
  Animation animation;
  MapZoomPanBehavior _zoomPanBehavior;
  List<LineModel> line;
  MapShapeSource worldmap;

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
  void dispos(){
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
                              tooltipBuilder: (BuildContext context, int index){
                                return Container(
                                  padding: EdgeInsets.only(left: 5, top: 5),
                                  height: 40,
                                  width: 500,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text('${line[index].from}'),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('Distance  : '),
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
              ]
          );
        }
        )
    );
  }
}


class LineModel {
  const LineModel(this.from, this.to);
  final MapLatLng from;
  final MapLatLng to;
}

double calculateLngLat(double lat1, double lng1, double lat2, double lng2){
  var p = 0.017453292519943295;
  var c = cos;
  var a = 0.5 - c((lat2 - lat1) * p)/2 +
      c(lat1 * p) * c(lat2 * p) *
          (1 - c((lng2 - lng1) * p))/2;
  return 12742 * asin(sqrt(a));
}

class FourthRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Donate",
            style: TextStyle(
              fontSize: 30,
            )),
        backgroundColor: Colors.lightGreen,
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
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Column(
                children: [
                  Container(
                    width: 200,
                    child: GestureDetector(
                      onTap: () async {
                        const url =
                            'https://wildaid.org/about/ways-to-give/';

                        if (await canLaunch(url)) {
                          await launch(url, forceSafariVC: false);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      child: Image(
                        image: AssetImage('assets/images/wildaid-logo.jpg'),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    margin: EdgeInsets.only(bottom: 15.0),
                    child: Text(
                      "WildAid works to reduce global consumption of wildlife products and to increase local support for conservation efforts.",
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    width: 200,
                    child: GestureDetector(
                        onTap: () async {
                          const url =
                              'https://www.wcs.org/our-work/species/african-elephants';

                          if (await canLaunch(url)) {
                            await launch(url, forceSafariVC: false);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                      child: Image(
                        image: AssetImage('assets/images/Wildlife-Conservation-Society-logo.png'),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    margin: EdgeInsets.only(bottom: 15.0),
                    child: Text(
                      "WCS supports rangers and help government agencies better manage rangers' patrols. WCS also helps protect elephants at key sites through the use of intelligence networks and aerial surveillance.",
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    width: 200,
                    child: GestureDetector(
                      onTap: () async {
                        const url = 'https://www.tusk.org';

                        if (await canLaunch(url)) {
                          await launch(url, forceSafariVC: false);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      child: Image(
                        image: AssetImage('assets/images/Tusk-logo.png'),
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    margin: EdgeInsets.only(bottom: 15.0),
                    child: Text(
                      "Tusk works with its project partners to find sustainable solutions to preserve critical habitats, protect endangered species, combat the illegal wildlife trade, empower local communities and promote environmental education.",
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    width: 200,
                    child: GestureDetector(
                      onTap: () async {
                        const url = 'https://www.speciesprotection.com/';

                        if (await canLaunch(url)) {
                          await launch(url, forceSafariVC: false);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      child: Image(
                        image: AssetImage('assets/images/espa-logo.png'),
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    margin: EdgeInsets.only(bottom: 15.0),
                    child: Text(
                      "The Endangered Species Protection Agency works within International Law and with local law enforcement to conserve and protect critically endangered and threatened species.",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FifthRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Elephant Map",
            style: TextStyle(
              fontSize: 30,
            )),
        backgroundColor: Colors.lightGreen,
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
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Back!'),
        ),
      ),
    );
  }
}

class SixthRoute extends StatefulWidget{
  SixthRoute({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SixthRoute createState() => _SixthRoute();
}

class _SixthRoute extends State<SixthRoute> {
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
                              width: 200,
                              height: 200,
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Total elephant deaths: ${models[index].totalDeaths}",
                                  ),
                                  Text(
                                    "Elephants killed by poaching: ${models[index].poachingDeaths}",
                                  ),
                                  Text(
                                      "Percentage of elephants poached ${(100 * (models[index].poachingDeaths / models[index].totalDeaths)).toStringAsFixed(2)}%"),
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
                          series: <ChartSeries>[
                            LineSeries<DeathData, int>(
                                dataSource: chartData,
                                //xValueMapper: (DeathData illegalCarcasses, _) => chartData[selectedIndex].year,
                                //yValueMapper: (DeathData illegalCarcasses, _) => chartData[selectedIndex].illegalCarcasses,
                                xValueMapper: (DeathData illegalCarcasses, _) => illegalCarcasses.year,
                                yValueMapper: (DeathData illegalCarcasses, _) => illegalCarcasses.illegalCarcasses,
                                dataLabelSettings: DataLabelSettings(isVisible: true)
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

