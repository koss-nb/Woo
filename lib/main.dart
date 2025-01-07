import 'package:flutter/material.dart';
import 'package:woo/presentation/screens/pages/slashscreens/startup_screen.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Assure une initialisation correcte avant d'appeler du code asynchrone
  await requestPermissions(); // Appel explicite de la méthode pour demander les autorisations
  runApp(const MyApp());
}

Future<void> requestPermissions() async {
  if (await Permission.microphone.request().isGranted) {
    print('Microphone access granted');
  } else {
    print('Microphone access denied');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: StartupScreen(),
      theme: ThemeData(
        fontFamily: 'Poppins', // Remplacez par le nom de la police souhaitée
      ),
    );
  }
}
