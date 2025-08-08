part of 'challenges_bloc.dart';

sealed class ChallengesState {}

class GetChallengesLoading extends ChallengesState {}

class GetChallengesSuccess extends ChallengesState {
  final List<Challenge> challenges;

  GetChallengesSuccess(this.challenges);
}

class GetChallengesError extends ChallengesState {
  final String error;

  GetChallengesError(this.error);
}
