import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:woo/core/widgets/color.dart';
import 'package:woo/core/widgets/customTextWidget.dart';
import 'package:woo/core/widgets/logoButton.dart';
import 'package:woo/presentation/screens/pages/auth_page/register_login.dart';

class WelcomeScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Image de fond avec flou et fond blanc
          Container(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2), // Effet de flou
              child: Container(
                color: Colors.white.withOpacity(0.9), // Fond blanc avec opacité
              ),
            ),
          ),
          // Texte en haut à gauche
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: CustomTextWidget(
              content: "for our passion",
              color: AppColors.primary,
              fontFamily: "Poppins",
            ),
          ),
          // Bouton en bas à droite
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: LogoButton(
                name: "Logo Button",
                onTap: () {
                  // Action lors du clic
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Register_loginPage()),
                  );
                  print("LogoButton tapé !");
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}


