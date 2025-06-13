import 'package:flutter/material.dart';
import 'package:unsij_places/configurations/app_theme.dart';
import 'package:unsij_places/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unsij-Places',
      theme: appTheme,
      debugShowCheckedModeBanner: false, // Desactiva el banner de debug
      home: const MyHomeScreen(title: 'UnsijPlaces'),
    );
  }
}