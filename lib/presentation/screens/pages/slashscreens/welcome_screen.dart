import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:woo/core/widgets/customTextWidget.dart';
import 'package:woo/presentation/screens/pages/slashscreens/welcome_screen_2.dart';
import 'package:woo/core/widgets/logobutton.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (index) {
          print("Navigué vers la page $index");
        },
        children: [
          Stack(
            fit: StackFit.expand,
            children: [
              // Image de fond avec flou
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        "images/5bd5fc17416c01761655b8e5335c6f03.jpg"), // Chemin de l'image
                    fit: BoxFit.cover, // S'étend pour couvrir tout l'écran
                  ),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2), // Effet de flou
                  child: Container(
                    color: Colors.black
                        .withOpacity(0.2), // Superposition noire semi-transparente
                  ),
                ),
              ),
              // Texte en haut à gauche
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: CustomTextWidget(
                  content: "Word Of Otaku",
                  fontFamily: 'Poppins', // Nom exact défini dans pubspec.yaml
                ),
              ),

              Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: LogoButton(
                name: "Logo Button",
                onTap: () {
                },
              ),
            ),
          ),
            ],
          ),
          // Deuxième écran (WelcomeScreen2)
          WelcomeScreen2(),
        ],
      ),
    );
  }
}
