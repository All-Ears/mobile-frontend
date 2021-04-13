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
                        height: 1280.0,
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
              'Forest elephants (Loxodonta africana cyclotis) are an elusive subspecies of African elephants that inhabit the densely wooded rainforests of west and central Africa. Their preference for dense forest habitat prohibits traditional counting methods such as visual identification. Their population is usually estimated through "dung counts"—an analysis  of the density and distribution of the feces. Forest elephants face severe threats from poaching and habitat loss, causing a population reduction of over 60% from 2002-2013 in central Africa. Although relatives of the highly studied African savanna elephant (Loxodonta africana), forest elephants are different morphologically, socially, and ecologically. Forest elephants are smaller than savanna elephants, the other African elephant subspecies. Their ears are more oval-shaped ears and their tusks are straighter and point downward (the tusks of savanna elephants curve outwards). There are also differences in the size and shape of the skull and skeleton. Forest elephants are found most commonly in countries with relatively large blocks of dense forest such as Gabon, the Democratic Republic of Congo (DRC), Cameroon and Central African Republic in central Africa and Côte d’Ivoire, Liberia, and Ghana in west Africa.',
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
              'We study the interactions between forests and climate and how animals affect ecosystem function with a focus on tropical forests. Studying these relationships help us understand the way that forest elephants help draw down atmospheric carbon.',
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
              'Elephants are keystone species, meaning they provide ecosystem services such as seed dispersal, nutrient transfer across large gradients, and habitat creation from foraging, trampling, and upheaval of vegetation. However, elephants are continuously poached at astounding rates; it is estimated that 96 elephants are killed every day, or roughly one every 15 minutes. It was also recently discovered that changes in vegetation structure from forest elephant disturbance have significant effects on carbon stocks. Through selective browsing, seed dispersal, and clearing out of the understory, forest elephants promote larger trees and more carbon dense forests. If elephants were to become extinct in the African tropics, it is estimated that aboveground biomass would be reduced by 7%. Therefore, by protecting African forest elephants, you can also sequester carbon from the atmosphere.',
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
