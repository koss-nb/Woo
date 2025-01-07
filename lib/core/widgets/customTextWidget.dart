import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String content; // Texte à afficher
  final Color color; // Couleur du texte
  final String fontFamily; // Police personnalisée

  CustomTextWidget({
    required this.content,
    this.color = Colors.white, // Couleur par défaut
    this.fontFamily = 'Arial', // Police par défaut
  });

  @override
  Widget build(BuildContext context) {
    List<String> words = content.split(" ");
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.only(top: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: words.map((word) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.1),
            child: Text(
              word,
              style: TextStyle(
                fontSize: 40, // Taille de la police
                fontWeight: FontWeight.bold, // Style gras
                color: color, // Couleur du texte
                fontFamily: fontFamily, // Police personnalisée
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
