import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ambassador/index.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback textChangedCallBack;
  final bool obscure;
  final String labelTetx;
  final Icon? icon;
  final bool? suffixIconVisible;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.textChangedCallBack,
    required this.obscure,
    required this.labelTetx,
    this.icon,
    this.suffixIconVisible,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final ApplicationConfig _applicationConfig = GetIt.instance.get<ApplicationConfig>();

  bool _passwordVisible = false;
  Color iconColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.obscure != false ? !_passwordVisible : widget.obscure,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 0.0, color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: _applicationConfig.mainColor),
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: widget.labelTetx,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        prefixIcon: widget.icon,
        /*prefixIconColor: MaterialStateColor.resolveWith(
            (states) => states.contains(MaterialState.focused) ? _applicationConfig.mainColor : Colors.grey),*/
        suffixIcon: widget.suffixIconVisible != null
            ? GestureDetector(
                child: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  /*color: MaterialStateColor.resolveWith(
                          (states) => states.contains(MaterialState.focused) ? _applicationConfig.mainColor : Colors.grey),*/
                ),
                onTap: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              )
            : null,
      ),
      onChanged: (_) => widget.textChangedCallBack(),
    );
  }
}
