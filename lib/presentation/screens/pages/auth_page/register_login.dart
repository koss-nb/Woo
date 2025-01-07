import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:woo/core/widgets/button.dart';
import 'package:woo/core/widgets/color.dart';
import 'package:woo/presentation/screens/pages/auth_page/login.dart';
import 'package:woo/presentation/screens/pages/auth_page/register.dart';
import 'package:woo/presentation/screens/pages/faq.dart';

class Register_loginPage extends StatefulWidget {
  const Register_loginPage({super.key});

  @override
  State<Register_loginPage> createState() => _Register_loginPageState();
}

class _Register_loginPageState extends State<Register_loginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment
            .center, // Centre tout le contenu horizontalement et verticalement
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
          // Contenu de la page
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:
                CrossAxisAlignment.center, // Centre horizontalement les enfants
            children: [
              // Image en haut de la page
              Padding(
                padding:
                    const EdgeInsets.only(top: 150.0), // Espacement supérieur
                child: Image.asset(
                  'images/96x96.png',
                  width: 65,
                  height: 65,
                ),
              ),
              const SizedBox(height: 100),
              // Les boutons
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Button(
                          name: 'S\'inscrire',
                          buttonColor: AppColors.white,
                          buttonTextColor: AppColors.primary,
                          buttonWidth: double.infinity,
                          buttonFonSize: 15,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterPage()),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Button(
                          name: 'Se connecter',
                          buttonColor: AppColors.primary,
                          buttonTextColor: AppColors.white,
                          borderbuttonColor: AppColors.white,
                          buttonWidth: double.infinity,
                          buttonFonSize: 15,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Lien vers FAQ en bas
              Padding(
                padding: const EdgeInsets.only(bottom: 80.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FaqPage()),
                    );
                  },
                  child: const Text(
                    'FAQWOO',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
