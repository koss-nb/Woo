import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:woo/core/widgets/button.dart';
import 'dart:ui';
import 'package:woo/core/widgets/color.dart';
import 'package:woo/presentation/screens/pages/auth_page/account_validation.dart';

class ProfileImagePage extends StatefulWidget {
  @override
  _ProfileImagePageState createState() => _ProfileImagePageState();
}

class _ProfileImagePageState extends State<ProfileImagePage> {
  File? _image; // Pour stocker l'image sélectionnée

  // Méthode pour choisir une image depuis la galerie
  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _image = File(image.path); // Met à jour l'image sélectionnée
      });
    }
  }

  // Méthode pour capturer une image avec la caméra
  Future<void> _takePhoto() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      setState(() {
        _image = File(image.path); // Met à jour l'image capturée
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Image de fond
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'images/5bd5fc17416c01761655b8e5335c6f03.jpg'), // Remplace par ton image de fond
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          fit: StackFit.expand, // Remplir tout l'écran
          children: [
            // Appliquer le flou noir sur l'image de fond
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2), // Flou
              child: Container(
                color: Colors.black
                    .withOpacity(0.2), // Couleur noire semi-transparente
              ),
            ),
            
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment
                      .center, // Centre les enfants de la colonne
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Utilisation d'un Stack pour positionner le bouton au bas à droite
                    
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        // Afficher l'image de profil si elle est sélectionnée
                        _image != null
                            ? CircleAvatar(
                                radius: 80,
                                backgroundImage: FileImage(_image!),
                              )
                            : CircleAvatar(
                                radius: 80,
                                backgroundColor: Colors.grey.shade300,
                                child: const Icon(Icons.person_2_rounded,
                                    size: 150, color: Colors.white),
                              ),
                        // Bouton rond en bas à droite pour modifier l'image
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: AppColors.primary,
                            child: IconButton(
                              icon: const Icon(Icons.camera_alt_outlined,
                                  color: Colors.white),
                              onPressed: () {
                                // Vous pouvez choisir entre prendre une photo ou choisir depuis la galerie
                                _showImagePickerOptions();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Text(
                        "Ajouter une photo de profil",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 150),

                    // Bouton Suivant
                    Center(
                      child: Button(
                        name: 'Suivant',
                        buttonColor: AppColors.primary, // Couleur de fond
                        buttonTextColor: Colors.white, // Couleur du texte
                        borderbuttonColor:
                            Colors.white, // Couleur de la bordure
                        buttonFonSize: 16, // Taille de police
                        buttonWidth:
                            double.infinity, // Largeur du bouton (optionnelle)
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AccountValidation()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Méthode pour afficher un choix entre la galerie et la caméra
  void _showImagePickerOptions() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Choisir une source"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text("Galerie"),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage();
                },
              ),
              ListTile(
                title: const Text("Caméra"),
                onTap: () {
                  Navigator.pop(context);
                  _takePhoto();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page Suivante"),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text("Bienvenue sur la page suivante !"),
      ),
    );
  }
}
