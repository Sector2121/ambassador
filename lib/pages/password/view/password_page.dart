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
  final _passwordController = TextEditingController();
  bool buttonDisabled = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance.get<PasswordBloc>(),
      child: BlocConsumer<PasswordBloc, PasswordState>(
        listener: (context, state) {},
        builder: (context, state) {
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
              const Text('You have an account. Please complete the fields below'),
              CustomTextField(
                controller: _passwordController,
                textChangedCallBack: setButtonIfNecessary,
                obscure: true,
                icon: const Icon(Icons.key),
                suffixIconVisible: true,
                labelTetx: 'Password',
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
