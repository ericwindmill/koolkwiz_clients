import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(AuthGuard());
}

class AuthGuard extends StatelessWidget {
  AuthGuard({super.key});

  final authChangeStream = FirebaseAuth.instance.authStateChanges();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: StreamBuilder<User?>(
          stream: authChangeStream,
          builder: (context, asyncSnapshot) {
            if (asyncSnapshot.data != null) {
              if (asyncSnapshot.data!.uid == 'TODO, my phones UID') {
                return MainApp();
              }
            }
            return Center(
              child: Text('DENIED!'),
            );
          },
        ),
      ),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
