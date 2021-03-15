import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'app_drawer.dart';

class AboutPage extends StatelessWidget {
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
        drawer: AppDrawer(),
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
