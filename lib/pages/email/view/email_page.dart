import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ambassador/index.dart';

class EmailPage extends StatefulWidget {
  const EmailPage({super.key});

  @override
  State<EmailPage> createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  final _emailController = TextEditingController();
  bool buttonDisabled = true;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmailBloc, EmailState>(
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
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sign in or create an account',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              const SizedBox(height: 10),
              Text(
                'if you already have a diverzum account you can easily sign in, if not we will create one for you in no time!',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
              const SizedBox(height: 10),
              const Text('E-mail address'),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: _emailController,
                      textChangedCallBack: setButtonIfNecessary,
                      obscure: false,
                      icon: const Icon(Icons.email_outlined),
                      labelTetx: 'E-mail address',
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        buttonDisabled: buttonDisabled,
                        callback: () => context.read<EmailBloc>().add(EmailSentEvent(email: _emailController.text)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void setButtonIfNecessary() {
    if (_emailController.text.contains('@')) {
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
