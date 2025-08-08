import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/challenges_repository.dart';
import '../model/challenge.dart';

part 'challenges_event.dart';

part 'challenges_state.dart';

class ChallengesBloc extends Bloc<ChallengesEvent, ChallengesState> {
  final ChallengesRepository challengesRepository;

  ChallengesBloc({required this.challengesRepository})
    : super(GetChallengesLoading()) {
    on<GetChallenges>(onGetChallenges);
  }

  onGetChallenges(GetChallenges event, Emitter<ChallengesState> emit) async {
    emit(GetChallengesLoading());
    try {
      final challenges = await challengesRepository.fetchChallenges();
      emit(GetChallengesSuccess(challenges));
    } catch (e) {
      emit(GetChallengesError(e.toString()));
    }
  }
}
