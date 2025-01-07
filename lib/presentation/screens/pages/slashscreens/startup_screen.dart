import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart'; // Import du package
import 'package:woo/core/widgets/color.dart';
import 'welcome_screen.dart'; // Import de la page WelcomeScreen

class StartupScreen extends StatefulWidget {
  @override
  _StartupScreenState createState() => _StartupScreenState();
}

class _StartupScreenState extends State<StartupScreen> {
  @override
  void initState() {
    super.initState();

    // Délai de 20 secondes avant de naviguer vers WelcomeScreen
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary, // Fond bleu
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Image.asset(
              'images/96x96.png', // Remplacez par le chemin de votre logo
              width: 150,
              height: 150,
            ),
            SizedBox(height: 20), // Espacement

            // Animation de chargement
            SpinKitCircle(
              color: Colors.yellow, // Couleur principale de l'animation
              size: 50.0, // Taille de l'animation
            ),
          ],
        ),
      ),
    );
  }
}
