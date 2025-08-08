import '../model/challenge.dart';

class ChallengesRepository {
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

  Future<List<Challenge>> fetchChallenges() async {
    await Future.delayed(Duration(seconds: 1));
    return sampleChallenges;
  }
}
