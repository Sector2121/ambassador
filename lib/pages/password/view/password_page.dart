import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ambassador/index.dart';

class PasswordPage extends StatefulWidget {
  const PasswordPage({super.key});

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  final MessageService _messageService = GetIt.instance.get<MessageService>();

  final _passwordController = TextEditingController();
  bool buttonDisabled = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance.get<PasswordBloc>(),
      child: BlocConsumer<PasswordBloc, PasswordState>(
        listener: (context, state) async {
          if (state is PasswordLoadedState) {
            NavigationService.of(context).goToLeaderboardPage();
          } else if (state is PasswordWrongState) {
            _messageService.showMessage(context, 'Wrong Password', state.message);
          }
        },
        builder: (context, state) {
          if (state is PasswordLoadingState) {
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
          } else if (state is PasswordLoadedState) {
            return Container();
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      context.read<EmailBloc>().add(Reset());
                      NavigationService.of(context).goBack();
                    },
                    child: const Icon(Icons.arrow_back),
                  ),
                  const Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sign in',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('You have an account. Please complete the fields below'),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                controller: _passwordController,
                textChangedCallBack: setButtonIfNecessary,
                obscure: true,
                icon: const Icon(Icons.key),
                suffixIconVisible: true,
                labelTetx: 'Password',
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      buttonDisabled: buttonDisabled,
                      callback: () =>
                          context.read<PasswordBloc>().add(PasswordSentEvent(password: _passwordController.text)),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  void setButtonIfNecessary() {
    if (_passwordController.text.length > 5) {
      setState(() {
        buttonDisabled = false;
      });
    } else {
      setState(() {
        buttonDisabled = true;
      });
    }
  }
}
