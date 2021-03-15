import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'app_drawer.dart';

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
      drawer: AppDrawer(),
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