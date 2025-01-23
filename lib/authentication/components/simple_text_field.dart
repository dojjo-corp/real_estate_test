import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SimpleTextField extends StatefulWidget {
  SimpleTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
  });

  final TextEditingController controller;
  final String hintText;
  Icon? prefixIcon;

  @override
  State<SimpleTextField> createState() => _SimpleTextFieldState();
}

class _SimpleTextFieldState extends State<SimpleTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      maxLines: 1,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        prefixIcon: widget.prefixIcon,
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
      validator: (String? value) {
        if (value!.isEmpty) {
          return "Field cannot be empty";
        }
        return null;
      },
    );
  }
}
