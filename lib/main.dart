import 'package:flutter/material.dart';
import 'package:gaji/pages/NavigationPage.dart';
import "dart:developer" as developer;

void main() {
  developer.log("some Print");
  runApp(const GajiApp());
}

class GajiApp extends StatelessWidget {
  const GajiApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gaji',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const NavigationPage(),
    );
  }
}
