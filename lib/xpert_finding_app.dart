import 'package:flutter/material.dart';
import 'package:xpertfunding/model/challenge.dart';

import 'components/challenge_card.dart';

class XpertFundingApp extends StatelessWidget {
  final List<Challenge> challenges;

  const XpertFundingApp({Key? key, required this.challenges}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF0A0E1A),
        appBar: AppBar(
          backgroundColor: const Color(0xFF0A0E1A),
          elevation: 0,
          leading: const Icon(Icons.menu, color: Colors.white),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 16),
              width: 32,
              height: 32,
              decoration: const BoxDecoration(
                color: Color(0xFF00C851),
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Text(
                  'VIP',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: challenges
                .map(
                  (challenge) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: ChallengeCard(challenge: challenge),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
