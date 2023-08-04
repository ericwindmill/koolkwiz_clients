import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:koolkwiz/firebase_options.dart';
import 'package:koolkwiz/marketplace/marketplace.dart';
import 'package:koolkwiz/screens/start_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Marketplace.theme,
      home: Scaffold(
        body: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 800,
          ),
          child: StartScreen(),
        ),
      ),
    );
  }
}
