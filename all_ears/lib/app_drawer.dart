import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240.0,
      child: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 130.0,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Row(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0),
                    child: GestureDetector(
                      child: Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/highreslogo.png'),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/');
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 1.0, right: 1.0),
                    child: Text(
                      'Elephant Footprint',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
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
            leading:
                Icon(Icons.monetization_on_outlined, color: Colors.amber[600]),
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
    );
  }
}
