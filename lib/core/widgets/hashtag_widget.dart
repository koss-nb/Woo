import 'package:flutter/material.dart';

class HashtagWidget extends StatelessWidget {
  final List<Map<String, dynamic>> hashtags = [
    {"image": "images/5bd5fc17416c01761655b8e5335c6f03.jpg", "name": "Hashtag 1"},
    {"image": "images/96x96.png", "name": "Hashtag 2"},
    {"image": "images/5bd5fc17416c01761655b8e5335c6f03.jpg", "name": "Hashtag 3"},
    {"image": "images/96x96.png", "name": "Hashtag 4"},
    {"image": "images/animes.jpeg", "name": "Hashtag 5"},
    {"image": "images/5bd5fc17416c01761655b8e5335c6f03.jpg", "name": "Hashtag 6"},
    {"image": "images/96x96.png", "name": "Hashtag 7"},
    {"image": "images/animes.jpeg", "name": "Hashtag 8"},
    {"image": null, "name": "Add"}, // Dernier élément avec un bouton "+"
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Affichage du texte "# mot clé" sur une seule ligne avec des styles différents
          Row(
            children: [
              // Container pour le "#" avec fond coloré et bords arrondis
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "#",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                "WOO",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Liste horizontale
          SizedBox(
            height: 105, // Hauteur des éléments
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: hashtags.length,
              separatorBuilder: (context, index) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final hashtag = hashtags[index];
                if (hashtag["image"] == null) {
                  // Dernier élément : Bouton "+"
                  return GestureDetector(
                    onTap: () {
                      // Action pour ajouter un nouveau hashtag
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Ajouter un nouveau hashtag')),
                      );
                    },
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Icon(Icons.add, color: Colors.blue),
                      ),
                    ),
                  );
                }

                // Éléments normaux
                return Column(
                  children: [
                    Container(
                      width: 80,
                      height: 105,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: AssetImage(hashtag["image"]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accueil'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Ajout du HashtagWidget avec prise de toute la largeur
            HashtagWidget(),
            const SizedBox(height: 20),
            // Autres éléments de votre page
            // Ajoutez vos autres widgets ici...
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: MyHomePage()));
