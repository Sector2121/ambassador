import 'package:flutter/material.dart';
import 'package:ambassador/index.dart';
import 'package:get_it/get_it.dart';

class CustomButton extends StatelessWidget {
  final ApplicationConfig _applicationConfig = GetIt.instance.get<ApplicationConfig>();

  final bool buttonDisabled;
  final VoidCallback callback;

  CustomButton({super.key, required this.buttonDisabled, required this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: buttonDisabled ? Colors.white : _applicationConfig.mainColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: TextButton(
        onPressed: () => buttonDisabled ? null : callback(),
        child: Text(
          'Continue',
          style: TextStyle(color: buttonDisabled ? Colors.grey : Colors.white),
        ),
      ),
    );
  }
}
