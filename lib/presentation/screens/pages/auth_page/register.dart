import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:woo/core/widgets/button.dart';
import 'package:woo/core/widgets/color.dart';
import 'package:woo/core/widgets/formfield.dart';
import 'package:woo/presentation/screens/pages/add_profile_photo.dart';
import 'package:woo/presentation/screens/pages/condition.dart';
import 'package:woo/presentation/screens/pages/auth_page/login.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _showPassword = false;
  bool _acceptTerms = false;

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
            padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    "Inscription",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                // Pseudonyme Field avec FormFieldWidget
                FormFieldWidget(
                  labelContent: 'Pseudonyme',
                  maxLengtText: 30,
                  prefixIconWidget: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 5,
                        left: 8,
                        top: 8), // Ajustez les marges si nécessaire
                    child: FaIcon(
                      FontAwesomeIcons.at,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                  suffixIconVisible: Icon(Icons.check_circle_sharp,
                      color: Colors.green, size: 24),
                  suffixIconHidden:
                      Icon(Icons.warning_rounded, color: Colors.red),
                  onTap: () {
                    // Action sur le tap si nécessaire
                  },
                ),
                const SizedBox(height: 16),
                // Mot de passe Field avec FormFieldWidget
                FormFieldWidget(
                  labelContent: 'Mot de passe',
                  maxLengtText: 20,
                  prefixIconWidget: Icon(Icons.lock, color: Colors.white),
                  onTap: () {
                    // Action sur le tap si nécessaire
                  },
                ),
                const SizedBox(height: 16),
                // Confirmer le mot de passe Field avec FormFieldWidget
                FormFieldWidget(
                  labelContent: 'Confirmer le mot de passe',
                  maxLengtText: 20,
                  prefixIconWidget: Icon(Icons.lock, color: Colors.white),
                  suffixIconVisible: Icon(Icons.check_circle_sharp,
                      color: Colors.green, size: 24),
                  suffixIconHidden:
                      Icon(Icons.warning_rounded, color: Colors.red),
                  onTap: () {
                    // Action sur le tap si nécessaire
                  },
                ),
                const SizedBox(height: 8),
                // Afficher le mot de passe
                Row(
                  children: [
                    Checkbox(
                      value: _showPassword,
                      onChanged: (value) {
                        setState(() {
                          _showPassword = value!;
                        });
                      },
                      activeColor: Colors.green,
                      side: const BorderSide(color: Colors.white, width: 2),
                    ),
                    const Text(
                      'Afficher le mot de passe',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                // Accepter les conditions
                Row(
                  children: [
                    Checkbox(
                      value: _acceptTerms,
                      onChanged: (value) {
                        setState(() {
                          _acceptTerms = value!;
                        });
                      },
                      activeColor: Colors.green,
                      side: const BorderSide(color: Colors.white, width: 2),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Ouvrir les conditions d'utilisation
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Condition()),
                        );
                      },
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "J'accepte les ",
                              style: TextStyle(color: Colors.white),
                            ),
                            TextSpan(
                              text: "Conditions d'utilisation",
                              style: TextStyle(
                                color: Colors.white,
                                decoration: TextDecoration
                                    .underline, // Appliquer le soulignement ici
                              ),
                            ),
                            TextSpan(
                              text: " de WOO",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                // Bouton Suivant
                Center(
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
                            builder: (context) => ProfileImagePage()),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                // Lien vers Se connecter
                Center(
                  child: GestureDetector(
                    onTap: () {
                      // Naviguer vers la page de connexion
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Tu as déjà un compte ?  ",
                            style: TextStyle(color: Colors.white),
                          ),
                          TextSpan(
                            text: "Se connecter",
                            style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration
                                  .underline, // Appliquer le soulignement ici
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
