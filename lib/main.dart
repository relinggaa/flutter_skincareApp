import 'package:flutter/material.dart';
import 'package:gabriela_app/widgets/home.dart';
import 'package:gabriela_app/widgets/landing.dart';
import 'package:gabriela_app/widgets/login.dart'; // Import login page
import 'package:gabriela_app/widgets/validation.dart'; // Import login page

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
      // Setup routing here
      routes: {'/login': (context) => const Login()},
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const Login());
  }
}
