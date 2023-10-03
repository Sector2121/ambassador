import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ambassador/index.dart';

class EmailPage extends StatelessWidget {
  const EmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => GetIt.instance.get<EmailBloc>(),
      child: BlocConsumer<EmailBloc, EmailState>(
        listener: (context, state) {
          if (state is EmailLoadedState) {
            NavigationService.of(context).goToPasswordPage();
          }
        },
        builder: (context, state) {
          if (state is EmailLoadingState) {
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
          } else if (state is EmailLoadedState) {
            return Container();
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Sign in or create an account',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              const Text(
                  'if you already have a diverzum account you can easily sign in, if not we will create one for you in no time!'),
              ElevatedButton(
                onPressed: () => context.read<EmailBloc>().add(EmailSentEvent(email: 'foldvariadamdavid@gmail.com')),
                child: const Text('Continue'),
              ),
              SizedBox(
                height: height * 0.3,
              )
            ],
          );
        },
      ),
    );
  }
}
