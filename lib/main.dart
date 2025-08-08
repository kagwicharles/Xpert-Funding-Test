import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xpertfunding/bloc/bloc.dart';
import 'package:xpertfunding/data/challenges_repository.dart';

import 'package:xpertfunding/xpert_finding_app.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ChallengesBloc>(
          create: (context) =>
              ChallengesBloc(challengesRepository: ChallengesRepository()),
        ),
      ],
      child: XpertFundingApp(),
    ),
  );
}
