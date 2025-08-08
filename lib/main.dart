import 'package:flutter/material.dart';
import 'package:xpertfunding/model/challenge.dart';
import 'package:xpertfunding/xpert_finding_app.dart';

void main() {
  final sampleChallenges = [
    Challenge(
      id: '123456789FD',
      createdAt: DateTime(2025, 3, 20),
      balance: 6340.0,
      equity: 6340.0,
      accountName: 'Two Step Challenge',
      currentPhase: 1,
      // Evaluation 1
      numPhases: 3,
      size: 5000.0,
      active: true,
      isProAccount: true,
    ),
    Challenge(
      id: '123456789FD',
      createdAt: DateTime(2025, 3, 20),
      balance: 6340.0,
      equity: 6340.0,
      accountName: 'Two Step Challenge',
      currentPhase: 0,
      // Funded
      numPhases: 3,
      size: 25000.0,
      active: true,
      isProAccount: true,
    ),
    Challenge(
      id: '123456789FD',
      createdAt: DateTime(2025, 3, 20),
      balance: 6340.0,
      equity: 6340.0,
      accountName: 'Two Step Challenge',
      currentPhase: 0,
      // Funded
      numPhases: 3,
      size: 10000.0,
      active: true,
      isProAccount: true,
    ),
  ];

  runApp(XpertFundingApp(challenges: sampleChallenges));
}
