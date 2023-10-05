import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ambassador/index.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class PullToRefreshContainer extends StatelessWidget {
  final ApplicationConfig _applicationConfig = GetIt.instance.get<ApplicationConfig>();

  final Widget child;
  final Future<void> Function() onRefresh;
  final RefreshController refreshController;
  final ScrollController scrollController;

  PullToRefreshContainer({
    Key? key,
    required this.child,
    required this.onRefresh,
    required this.refreshController,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: refreshController,
      scrollController: scrollController,
      header: MaterialClassicHeader(
        color: _applicationConfig.mainColor,
      ),
      onRefresh: () async {
        try {
          await onRefresh();
          refreshController.refreshCompleted();
        } catch (_) {
          refreshController.refreshFailed();
        }
      },
      child: child,
    );
  }
}
