import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ambassador/index.dart';

class PasswordPage extends StatelessWidget {
  const PasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => GetIt.instance.get<PasswordBloc>(),
      child: BlocConsumer<PasswordBloc, PasswordState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      context.read<EmailBloc>().add(Reset());
                      NavigationService.of(context).goBack();
                      //await context.read<EmailBloc>().close();
                      //context.read<EmailBloc>().add(Reset());
                    },
                    child: const Icon(Icons.arrow_back),
                  ),
                  const Center(
                    child: Text(
                      'Sign in',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                  ),
                ],
              ),
              const Text('You have an account. Please complete the fields below'),
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
