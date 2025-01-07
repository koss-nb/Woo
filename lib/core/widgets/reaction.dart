import 'package:flutter/material.dart';
import 'package:woo/core/widgets/color.dart';

class ReactionBar extends StatefulWidget {
  @override
  _ReactionBarState createState() => _ReactionBarState();
}

class _ReactionBarState extends State<ReactionBar> {
  final List<Map<String, String>> reactions = [
    {'emoji': '🤩', 'label': 'Love'},
    {'emoji': '😊', 'label': 'Kawaii'},
    {'emoji': '😂', 'label': 'Haha'},
    {'emoji': '😮', 'label': 'Wow'},
    {'emoji': '😢', 'label': 'Sad'},
    {'emoji': '😡', 'label': 'Angry'},
  ];

  bool _isReactionSelected = false;

  void _handleReaction(String label) {
    // Afficher un snack-bar avec la réaction sélectionnée
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Vous avez réagi avec: $label'),
      ),
    );

    // Masquer la barre des réactions après la sélection
    setState(() {
      _isReactionSelected = true;
    });

    // Retirer les réactions après 2 secondes
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isReactionSelected = true; // Réaffiche les réactions
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: _isReactionSelected
          ? SizedBox.shrink()
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: reactions.map((reaction) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () => _handleReaction(reaction['label']!),
                      child: Text(
                        reaction['emoji']!,
                        style: TextStyle(fontSize: 30, color: AppColors.secondary),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      reaction['label']!,
                      style: TextStyle(
                        fontSize: 6,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
    );
  }
}
