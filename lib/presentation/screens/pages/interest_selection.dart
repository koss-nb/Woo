import 'package:flutter/material.dart';
import 'package:woo/core/widgets/button.dart';
import 'package:woo/core/widgets/color.dart';
import 'package:woo/presentation/screens/pages/news.dart';

class InterestSelectionPage extends StatefulWidget {
  @override
  _InterestSelectionPageState createState() => _InterestSelectionPageState();
}

class _InterestSelectionPageState extends State<InterestSelectionPage> {
  final List<String> interests = [
    'Sports',
    'Musique',
    'Technologie',
    'Voyages',
    'Art',
    'Cuisine',
    'Lecture',
    'Cinéma',
    'Jardinage',
    'Photographie',
    'Mode',
    'Santé',
    'Fitness',
    'Danse',
    'Théâtre',
    'Gaming',
    'Écriture',
    'Animaux',
    'Nature',
    'Histoire',
    'Architecture',
    'Science',
    'Astrologie',
    'Automobile',
    'Politique',
    'Business',
    'Économie',
    'Education',
    'DIY (Do It Yourself)',
    'Podcasts',
    'Peinture',
    'Sculpture',
    'Design',
    'Langues étrangères',
    'Philosophie',
    'Méditation',
    'Yoga',
    'Randonnée',
    'Plongée',
    'Sports extrêmes',
    'Esport',
    'Astronomie',
    'Biologie',
    'Chant',
    'Comédie',
    'Poésie',
    'Technologie verte',
    'Innovation',
    'Cryptomonnaie',
    'Voyages de luxe',
    'Culture urbaine',
    'Animation japonaise (Anime)'
    // Ajoutez des éléments si nécessaire
  ];

  final Map<String, bool> selectedInterests = {};

  @override
  void initState() {
    super.initState();
    for (var interest in interests) {
      selectedInterests[interest] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Centres d\'intérêt'),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 15,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.white,
        elevation: 6, // Ombre
        shadowColor: Colors.black.withOpacity(0.6), // Ombre douce
      ),
      backgroundColor: Colors.white, // Fond blanc pour la page
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Centrer verticalement
                crossAxisAlignment:
                    CrossAxisAlignment.center, // Centrer horizontalement
                children: [
                  const Text(
                    'Sélectionnez vos centres d\'intérêt :',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  // Center le Wrap dans un Container
                  Center(
                    child: Wrap(
                      spacing: 10, // Espacement horizontal
                      runSpacing: 10, // Espacement vertical
                      alignment: WrapAlignment
                          .center, // Centrer les éléments dans le Wrap
                      children: interests.map((interest) {
                        final isSelected = selectedInterests[interest] ?? false;
                        return Button(
                          name: interest,
                          buttonColor:
                              isSelected ? AppColors.primary : Colors.white,
                          buttonTextColor:
                              isSelected ? Colors.white : AppColors.primary,
                          borderbuttonColor: AppColors.primary,
                          buttonFonSize: 12,
                          onTap: () {
                            setState(() {
                              selectedInterests[interest] = !isSelected;
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 16.0, // Positionner à 16 pixels du bas
            left: 16.0,
            right: 16.0,
            child: Button(
              name: 'Confirmer',
              buttonColor: AppColors.primary,
              buttonTextColor: Colors.white,
              buttonFonSize: 16,
              onTap: () {
                final selected = selectedInterests.entries
                    .where((entry) => entry.value)
                    .map((entry) => entry.key)
                    .toList();

                if (selected.isNotEmpty) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Centres d\'intérêt sélectionnés'),
                      content: Text(selected.join(', ')),
                      actions: [
                        TextButton(
                          onPressed: () {
                            // Naviguer vers la page de connexion
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NewsPage()),
                            );
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                          'Veuillez sélectionner au moins un centre d\'intérêt.'),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
