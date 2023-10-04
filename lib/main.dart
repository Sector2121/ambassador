import 'package:flutter/material.dart';
import 'package:ambassador/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

void main() {
  registerServices();
  registerBlocs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ApplicationConfig _applicationConfig = GetIt.instance.get<ApplicationConfig>();

  final GoRouter _router = createRouterConfig();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
        create: (context) => GetIt.instance.get<EmailBloc>(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: _router,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: _applicationConfig.mainColor),
          useMaterial3: true,
        ),
      ),
    );
  }
}
