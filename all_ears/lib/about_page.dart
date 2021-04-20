import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        color: Colors.white,
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
                'Purpose',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'As highlighted in the New York Times, recent scientific research has quantified how African forest elephants sequester carbon in tropical forests, thus reducing climate change and providing a carbon storage service worth US\$43 billion dollars. By contributing the suggested amount to offset your flight’s carbon emissions, your money will help fight climate change and conserve dangerously threatened forest elephant populations.\n',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                'About Megabiota Labs',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'We study megabiota, the largest plants and animals, and how they interact and affect their ecosystems. More specifically, study the interactions between forests and climate and how animals affect ecosystem function with a focus on tropical forests. Studying these relationships help us understand the way that forest elephants help draw down atmospheric carbon. \n',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
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
              'Forest elephants (Loxodonta africana cyclotis) are an elusive subspecies of African elephants that inhabit the densely wooded rainforests of west and central Africa. They are found most commonly in countries with relatively large blocks of dense forest such as Gabon, the Democratic Republic of Congo (DRC), Cameroon and Central African Republic in central Africa and Côte d’Ivoire, Liberia, and Ghana in west Africa.\n',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              "Location and Population.",
              style: TextStyle(
                fontSize: 17,
                fontStyle: FontStyle.italic,
              ),
            ),
            Text(
              "Their preference for dense forest habitat prohibits traditional counting methods such as visual identification. Their population is usually estimated through \"dung counts\"—an analysis of the density and distribution of the feces. Forest elephants face severe threats from poaching and habitat loss, causing a population reduction of over 60% from 2002-2013 in central Africa.\n",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text("Differences with Savanna Elephants",
              style: TextStyle(
                fontSize: 17,
                fontStyle: FontStyle.italic,
              ),
            ),
            Text("Although relatives of the highly studied African savanna elephant (Loxodonta africana), forest elephants are different morphologically, socially, and ecologically. Forest elephants are smaller than savanna elephants, the other African elephant subspecies. Their ears are more oval-shaped ears and their tusks are straighter and point downward (the tusks of savanna elephants curve outwards). There are also differences in the size and shape of the skull and skeleton.\n",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text("Role in the Forest",
              style: TextStyle(
                fontSize: 17,
                fontStyle: FontStyle.italic,
              ),
            ),
            Text("All African elephants knock down trees, but forest elephants help improve the rainforest in a unique way. They knock down the smaller trees to let the larger ones continue to grow and stay healthy. This improves the health of the forest as a whole. \n",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                'Why You Should Donate',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text("Elephants are keystone species, meaning they provide ecosystem services such as seed dispersal, nutrient transfer across large gradients, and habitat creation from foraging, trampling, and upheaval of vegetation. However, elephants are continuously poached at astounding rates; it is estimated that 96 elephants are killed every day, or roughly one every 15 minutes.\n",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text("It was also recently discovered that changes in vegetation structure from forest elephant disturbance have significant effects on carbon stocks. Through selective browsing, seed dispersal, and clearing out of the understory, forest elephants promote larger trees and more carbon dense forests. If elephants were to become extinct in the African tropics, it is estimated that aboveground biomass would be reduced by 7%. Therefore, by protecting African forest elephants, you can also sequester carbon from the atmosphere.\n",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                'Sources',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              child: new InkWell(
                  child: new Text("ICUN Article: \"African elephant species now Endangered and Critically Endangered - IUCN Red List\n",
                      style: TextStyle(
                          color: Colors.blue[400])
                  ),
                  onTap: () => launch('https://www.iucn.org/news/species/202103/african-elephant-species-now-endangered-and-critically-endangered-iucn-red-list')
              ),
            ),
            Container(
              child: new InkWell(
                  child: new Text("Nature Geoscience Journal: \"Carbon stocks in central African forests enhanced by elephant disturbance\n",
                      style: TextStyle(
                      color: Colors.blue[400])
                  ),
                  onTap: () => launch('https://www.nature.com/articles/s41561-019-0395-6')
              ),
            ),
            Container(
              child: new InkWell(
                  child: new Text("New York Times: \"The Thick Gray Line: Forest Elephants Defend Against Climate Change\n",
                      style: TextStyle(
                          color: Colors.blue[400])
                  ),
                  onTap: () => launch('https://www.nytimes.com/2019/08/19/science/elephants-climate-change.html')
              ),
            ),
          ],
        ),
      ),
      /*3*/
    ],
  ),
);
