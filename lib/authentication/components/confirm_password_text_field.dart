import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ConfirmPasswordTextField extends StatefulWidget {
  ConfirmPasswordTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  final TextEditingController controller;
  final String hintText;
  bool obscureText;

  @override
  State<ConfirmPasswordTextField> createState() =>
      _ConfirmPasswordTextFieldState();
}

class _ConfirmPasswordTextFieldState extends State<ConfirmPasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      maxLines: 1,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        hintText: "Confirm Password",
        hintStyle: const TextStyle(color: Colors.grey),
        prefixIcon: Icon(
          Icons.lock_outline_rounded,
          color: Colors.grey,
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              widget.obscureText = !widget.obscureText;
            });
          },
          child: Icon(
            widget.obscureText ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.grey[50]!,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.grey[300]!,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor.withValues(alpha: 0.6),
            width: 2,
          ),
        ),
      ),
    );
  }
}
