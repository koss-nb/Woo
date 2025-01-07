import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:woo/core/widgets/button.dart';
import 'package:woo/core/widgets/color.dart';
import 'package:woo/presentation/screens/pages/create_news2.dart';

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  int _selectedTabIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Ajouter une nouvelle publication",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey.shade500,
            height: 1.0,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildTab("Ajouter des photos", Icons.image, 0),
              _buildTab("Ajouter une vidéo", Icons.videocam, 1),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: _selectedTabIndex == 0 ? 5 : 3,
                width: MediaQuery.of(context).size.width / 2,
                color: _selectedTabIndex == 0 ? AppColors.primary : Colors.grey.shade500,
              ),
              Container(
                height: _selectedTabIndex == 1 ? 5 : 3,
                width: MediaQuery.of(context).size.width / 2,
                color: _selectedTabIndex == 1 ? AppColors.primary : Colors.grey.shade500,
              ),
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            child: _selectedTabIndex == 0 ? _buildPhotoGrid() : _buildVideoGrid(),
          ),

          // Bouton Suivant
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: Button(
                    name: 'Suivant',
                    buttonColor: AppColors.primary, // Couleur de fond du bouton
                    buttonTextColor: Colors.white, // Couleur du texte
                    buttonWidth: double.infinity,
                    buttonFonSize: 15, // Largeur du bouton (optionnel)
                    borderbuttonColor: AppColors.white, // Couleur de la bordure
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreatePage2()),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String title, IconData icon, int index) {
    bool isSelected = _selectedTabIndex == index;
    return GestureDetector(
      onTap: () => _onTabSelected(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: isSelected ? AppColors.primary : Colors.grey.shade300,
            child: Icon(
              icon,
              color: isSelected ? Colors.white : Colors.grey,
              size: 30,
            ),
          ),
          SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoGrid() {
  // Exemple de liste d'images
  final List<String> images = [
    'images/n2.png', // Remplacez par les chemins réels de vos images
    'images/n3.png',
    'images/n4.png',
    'images/n1.png',
    'images/n3.png',
    'images/96x96.png',
  ];

  return MasonryGridView.count(
    crossAxisCount: 2, // Nombre de colonnes
    mainAxisSpacing: 10,
    crossAxisSpacing: 10,
    padding: EdgeInsets.all(8.0),
    itemCount: images.length + 1, // Inclut le bouton caméra
    itemBuilder: (context, index) {
      if (index == 0) {
        return _buildCameraButton();
      }
      final imagePath = images[index - 1]; // Décale l'index pour correspondre aux images
      return ClipRRect(
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover, // Ajustez en fonction de votre besoin
        ),
      );
    },
  );
}

  Widget _buildVideoGrid() {
    return Column(
      children: [
        // Bouton pour enregistrer une vidéo
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            padding: EdgeInsets.all( 10),
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade500,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.videocam, size: 40, color: Colors.white),
                SizedBox(height: 10),
                Text(
                  "Enregistrer une vidéo",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        // Liste des vidéos
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: 3, // Exemple : 3 vidéos
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage('images/n2.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCameraButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(10),
        height: 120,
        decoration: BoxDecoration(
          color: Colors.grey.shade500,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.camera_alt, size: 40, color: Colors.white),
            SizedBox(height: 10),
            Text(
              "Utiliser la caméra",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(10),
        height: 120,
        decoration: BoxDecoration(
          color: Colors.grey.shade500,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.videocam, size: 40, color: Colors.white),
            SizedBox(height: 10),
            Text(
              "Enregistrer une vidéo",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
