import 'package:flutter/material.dart';
import 'package:woo/core/widgets/color.dart';

class Achtag extends StatefulWidget {
  final String name;
  final Color backgroundColor;
  final String simbole;
  final String message;
  final void Function()? onTap;

  const Achtag({
    Key? key,
    required this.name,
    required this.backgroundColor,
    required this.simbole,
    required this.message,
    this.onTap,
  }) : super(key: key);

  @override
  State<Achtag> createState() => _AchtagState();
}

class _AchtagState extends State<Achtag> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ), // Ajout de marges
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            // Icône arrondie
            ClipRRect(
              borderRadius: BorderRadius.circular(15), // Arrondi des bords
              child: Container(
                padding: const EdgeInsets.all(8),
                height: 45,
                width: 45,
                color: Colors.blueAccent, // Fond blanc autour de l'icône
                child:Text(
                  widget.simbole,
                  textAlign:TextAlign.center,
                   style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                ) ,
              ),
            ),
            const SizedBox(width: 15),
            // Texte
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.message,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
