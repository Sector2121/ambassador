import 'package:ambassador/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class ScoreBoardPage extends StatelessWidget {
  final ApplicationConfig _applicationConfig = GetIt.instance.get<ApplicationConfig>();

  ScoreBoardPage({super.key});

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
            final scores = state.scores;
            return ListView.builder(
              itemCount: scores.length,
              itemBuilder: (context, index) {
                final score = scores[index];
                return Card(
                  color: index == 0 ? _applicationConfig.mainColor : Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: DefaultTextStyle(
                      style: TextStyle(color: index == 0 ? Colors.white : Colors.black),
                      child: Row(
                        children: [
                          Text((index + 1).toString()),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(score.name),
                          ),
                          Text(score.userCount.toString()),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return Text('asd');
        },
      ),
    );
  }
}
