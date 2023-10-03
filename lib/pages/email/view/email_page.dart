import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ambassador/index.dart';

class EmailPage extends StatefulWidget {

  EmailPage({super.key});

  @override
  State<EmailPage> createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  final ApplicationConfig _applicationConfig = GetIt.instance.get<ApplicationConfig>();

  final _emailController = TextEditingController();
  bool buttonDisabled = true;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double bottom = MediaQuery.of(context).viewInsets.bottom;
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
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sign in or create an account',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
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
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(width: 0.0, color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1, color: _applicationConfig.mainColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: 'Password',
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                          ),
                          prefixIconColor: MaterialStateColor.resolveWith(
                            (states) => states.contains(MaterialState.focused) ? _applicationConfig.mainColor : Colors.grey,
                          ),
                        ),
                        onChanged: (_) {
                          if(_emailController.text.contains('@')) {
                            setState(() {
                              buttonDisabled = false;
                            });
                          } else {
                            setState(() {
                              buttonDisabled = true;
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: buttonDisabled ? Colors.white : _applicationConfig.mainColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () => buttonDisabled ? null :
                                context.read<EmailBloc>().add(EmailSentEvent(email: _emailController.text)),
                            child: Text(
                              'Continue',
                              style: TextStyle(color: buttonDisabled ? Colors.grey : Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: max(MediaQuery.of(context).viewInsets.bottom, 0),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
