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

class SixthRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Frequently Asked Questions",
            style: TextStyle(
              fontSize: 24,
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