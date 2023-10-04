import 'package:ambassador/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class ScoreBoardPage extends StatelessWidget {
  const ScoreBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance.get<ScoreboardBloc>()..add(GetScoreboardEvent()),
      child: BlocBuilder<ScoreboardBloc, ScoreboardState>(
        builder: (context, state) {
          if (state is ScoreboardLoadingState) {
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(),
                ),
              ],
            );
          } else if (state is ScoreboardLoadedState) {
            return Text('letsgooooooooo');
          }
          return Text('asd');
        },
      ),
    );
  }
}
