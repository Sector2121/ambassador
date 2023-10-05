import 'package:ambassador/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class LeaderboardPage extends StatefulWidget {
  LeaderboardPage({super.key});

  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  final ApplicationConfig _applicationConfig = GetIt.instance.get<ApplicationConfig>();

  final RefreshController _refreshController = RefreshController(initialRefresh: false);
  final ScrollController _scrollController = ScrollController(initialScrollOffset: 0.0);

  @override
  void dispose() {
    _refreshController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance.get<LeaderboardBloc>()..add(GetLeaderboardEvent()),
      child: BlocBuilder<LeaderboardBloc, LeaderboardState>(
        builder: (context, state) {
          if (state is LeaderboardLoadingState) {
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
          } else if (state is LeaderboardLoadedState) {
            final scores = state.scores;
            return PullToRefreshContainer(
              refreshController: _refreshController,
              scrollController: _scrollController,
              onRefresh: () async {
                context.read<LeaderboardBloc>().add(GetLeaderboardEvent());
              },
              onLoading: () async {await Future.delayed(Duration(seconds: 3));},
              child: ListView.builder(
                primary: false,
                shrinkWrap: true,
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
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
