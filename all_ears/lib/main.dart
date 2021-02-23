// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => HomeRoute(),
      '/second': (context) => SecondRoute(),
      '/third': (context) => ThirdRoute(),
      '/fourth': (context) => FourthRoute(),
      '/fifth': (context) => FifthRoute(),
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
              title: Text('About'),
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
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              title: Text('Send Feedback'),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
          ],
        )),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('About',
                style: TextStyle(
                  fontSize: 25,
                )),
            onPressed: () {
              Navigator.pushNamed(context, '/second');
            },
          ),
          RaisedButton(
            child: Text('Carbon Calculator',
                style: TextStyle(
                  fontSize: 25,
                )),
            onPressed: () {
              Navigator.pushNamed(context, '/third');
            },
          ),
          RaisedButton(
            child: Text('Donate',
                style: TextStyle(
                  fontSize: 25,
                )),
            onPressed: () {
              Navigator.pushNamed(context, '/fourth');
            },
          ),
          RaisedButton(
            child: Text('Elephant Map',
                style: TextStyle(
                  fontSize: 25,
                )),
            onPressed: () {
              Navigator.pushNamed(context, '/fifth');
            },
          ),
        ],
      )),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "About Page",
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
                title: Text('About'),
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
                  Navigator.pushNamed(context, '/');
                },
              ),
              ListTile(
                title: Text('Send Feedback'),
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

class ThirdRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carbon Calculator",
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
              title: Text('About'),
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
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              title: Text('Send Feedback'),
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
              title: Text('About'),
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
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              title: Text('Send Feedback'),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
          ],
        )),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Column(
                // 1st Donation Site
                children: [
                  Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        child: Image(
                          image: AssetImage('assets/images/donation1.jpg'),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 50.0),
                        child: GestureDetector(
                          onTap: () async {
                            const url = 'https://google.com';

                            if (await canLaunch(url)) {
                              await launch(url, forceSafariVC: false);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          child: Text("Donation Site 1",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    margin: EdgeInsets.only(bottom: 20.0),
                    child: Text(
                      "    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat...",
                    ),
                  ),
                ],
              ),
              Column(
                // 2nd Donation Site
                children: [
                  Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        child: Image(
                          image: AssetImage('assets/images/donation2.png'),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 50.0),
                        child: GestureDetector(
                          onTap: () async {
                            const url = 'https://google.com';

                            if (await canLaunch(url)) {
                              await launch(url, forceSafariVC: false);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          child: Text("Donation Site 2",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    margin: EdgeInsets.only(bottom: 20.0),
                    child: Text(
                      "    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat...",
                    ),
                  ),
                ],
              ),
              Column(
                // 3rd Donation Site
                children: [
                  Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        child: Image(
                          image: AssetImage('assets/images/donation3.jpg'),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 50.0),
                        child: GestureDetector(
                          onTap: () async {
                            const url = 'https://google.com';

                            if (await canLaunch(url)) {
                              await launch(url, forceSafariVC: false);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          child: Text("Donation Site 3",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    margin: EdgeInsets.only(bottom: 20.0),
                    child: Text(
                      "    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat...",
                    ),
                  ),
                ],
              ),
              Column(
                // 4th Donation Site
                children: [
                  Row(
                    children: [
                      Container(
                        // Donation Image
                        width: 100,
                        height: 100,
                        child: Image(
                          image: AssetImage('assets/images/donation4.jpg'),
                        ),
                      ),
                      Container(
                        // Site Name
                        margin: EdgeInsets.symmetric(horizontal: 50.0),
                        child: GestureDetector(
                          onTap: () async {
                            const url = 'https://google.com';

                            if (await canLaunch(url)) {
                              await launch(url, forceSafariVC: false);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          child: Text("Donation Site 4",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      )
                    ],
                  ),
                  Container(
                    // Site Info
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    margin: EdgeInsets.only(bottom: 20.0),
                    child: Text(
                      "    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat...",
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
              title: Text('About'),
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
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              title: Text('Send Feedback'),
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
