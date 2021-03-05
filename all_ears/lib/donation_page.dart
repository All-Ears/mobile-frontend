
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'dart:math';
import 'home_page.dart';
import 'about_page.dart';
import 'carbon_calculate_page.dart';


class DonationPage extends StatelessWidget {
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