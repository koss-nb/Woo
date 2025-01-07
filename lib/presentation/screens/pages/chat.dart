import 'package:flutter/material.dart';
import 'package:woo/core/widgets/bottom_navigation.dart';
import 'package:woo/core/widgets/chat.dart';
import 'package:woo/presentation/screens/pages/create_news.dart';
import 'package:woo/presentation/screens/pages/news.dart';
import 'package:woo/presentation/screens/pages/notification.dart';
import 'package:woo/presentation/screens/pages/profile.dart'; // Assurez-vous que ce chemin est correct

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  int _selectedIndex = 1; // L'index initial est 1 pour afficher MessagePage
  final List<Widget> _pages = [
    NewsPage(), // Remplacez par la page d'accueil
    MessagePage(), // Remplacez par la page de messages
    CreatePage(), // Remplacez par la page de messages
    NotifiPage(), // Remplacez par la page de messages
    ProfilePage(), // Remplacez par la page de profil
  ];

  // Fonction de callback qui change l'index sélectionné
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.push(context, MaterialPageRoute(builder: (context) => _pages[index]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Chat(
        name: 'Nom de l’utilisateur', // Ajoutez le nom que vous souhaitez afficher dans l'AppBar
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex, // Passez l'index sélectionné
        onItemTapped: _onItemTapped,   // Passez la fonction callback
      ),
    );
  }
}
