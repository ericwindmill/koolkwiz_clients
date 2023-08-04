import 'package:animations/animations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:koolkwiz/marketplace/marketplace.dart';

import '../model/player.dart';
import '../util/name_generator.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  bool playerReady = false;
  late final Player player;

  @override
  void initState() {
    createUser();
    super.initState();
  }

  void createUser() async {
    // Create a user in Firebase Auth
    final userCredential = await FirebaseAuth.instance.signInAnonymously();

    final existingPlayerDoc = await FirebaseFirestore.instance
        .doc('users/${userCredential.user!.uid}')
        .get();

    // If user exists, this isn't their first time opening the app,
    // return early so we don't overwrite the score
    if (existingPlayerDoc.exists) {
      player = Player(
        id: existingPlayerDoc.id,
        name: existingPlayerDoc.data()!['name'],
      );
    } else {
      // The document doesn't exist, so this is the first time they're opening the app
      // Create a username and add them to Firestore
      player = Player(
        id: userCredential.user!.uid,
        name: generateRandomPlayerName(),
      );

      // Create user in Firestore, in order to track score
      await FirebaseFirestore.instance.doc('users/${player.id}').set({
        'score': player.score,
        'name': player.name,
      });
    }

    setState(() {
      playerReady = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Kool Kwiz',
              style: Marketplace.heading1.copyWith(fontSize: 64),
            ),
            Padding(
              padding: EdgeInsets.all(Marketplace.spacing6.toDouble()),
              child: PageTransitionSwitcher(
                transitionBuilder: (
                  Widget child,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                ) {
                  return FadeThroughTransition(
                      animation: animation,
                      secondaryAnimation: secondaryAnimation,
                      child: child);
                },
                child: playerReady
                    ? _StartButtonWidget(playerName: player.name!)
                    : _LoadingWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('Loading player credentials...'),
        SizedBox(height: 20),
        LinearProgressIndicator(
          minHeight: 10,
        ),
      ],
    );
  }
}

class _StartButtonWidget extends StatelessWidget {
  const _StartButtonWidget({super.key, required this.playerName});

  final String playerName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Player: $playerName'),
        SizedBox(height: 20),
        MarketButton(
          onPressed: () async {},
          text: 'Start Quiz!',
        )
      ],
    );
  }
}
