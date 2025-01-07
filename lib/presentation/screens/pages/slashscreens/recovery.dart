import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:woo/core/widgets/button.dart';
import 'package:woo/core/widgets/color.dart';
import 'package:woo/presentation/screens/pages/auth_page/account_recovery.dart';

class RecoveryPage extends StatefulWidget {
  @override
  _RecoveryPageState createState() => _RecoveryPageState();
}

class _RecoveryPageState extends State<RecoveryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Image de fond
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage("images/5bd5fc17416c01761655b8e5335c6f03.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Appliquer un flou noir sur l'image de fond
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Container(
              color: Colors.black
                  .withOpacity(0.2), // Opacité pour créer l'effet sombre
            ),
          ),
          // Contenu principal de la page
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 40.0, left: 10.0, right: 10.0),
            child: Column(
              children: [
                // Bouton retour en haut à gauche
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                // Espace flexible pour centrer le contenu principal
                const SizedBox(height: 150),
                // Texte "Récupération"
                Center(
                  child: Text(
                    "Récupération",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 80),
                // Message descriptif
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Pour récupérer ton compte, il te suffit d'inscrire les réponses que tu avais données aux questions secrètes qui t'ont été posées.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 80),
                // Bouton Suivant
                Center(
                  child: Button(
                    name: 'Suivant',
                    buttonColor: AppColors.primary, // Couleur de fond du bouton
                    buttonTextColor: Colors.white, // Couleur du texte
                    buttonWidth: double.infinity,
                    buttonFonSize: 15, // Taille du texte du bouton
                    borderbuttonColor: Colors.white, // Couleur de la bordure
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AccountRecovery()),
                      );
                    },
                  ),
                ),
                const SizedBox(
                    height:
                        20), // Espace pour éviter que le bouton touche le bas
              ],
            ),
          ),
        ],
      ),
    );
  }
}
