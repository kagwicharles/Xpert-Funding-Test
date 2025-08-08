import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xpertfunding/bloc/bloc.dart';
import 'package:xpertfunding/model/challenge.dart';

import 'components/challenge_card.dart';

class XpertFundingApp extends StatefulWidget {
  const XpertFundingApp({Key? key}) : super(key: key);

  @override
  State<XpertFundingApp> createState() => _XpertFundingAppState();
}

class _XpertFundingAppState extends State<XpertFundingApp> {
  bool loadingChallenges = false;
  List<Challenge> challenges = [];

  @override
  void initState() {
    super.initState();
    context.read<ChallengesBloc>().add(GetChallenges());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF0A0E1A),
        appBar: AppBar(
          backgroundColor: const Color(0xFF0A0E1A),
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: BlocListener<ChallengesBloc, ChallengesState>(
          listener: (context, state) {
            if (state is GetChallengesLoading) {
              setState(() {
                loadingChallenges = true;
              });
            }
            if (state is GetChallengesSuccess) {
              setState(() {
                loadingChallenges = false;
                challenges = state.challenges;
              });
            }
            if (state is GetChallengesError) {
              setState(() {
                loadingChallenges = false;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text("Could not load challenges"),
                ),
              );
            }
          },
          child: loadingChallenges
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      Text("Loading Challenges..."),
                    ],
                  ),
                )
              : SingleChildScrollView(
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
      ),
    );
  }
}
