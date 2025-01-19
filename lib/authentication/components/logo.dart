import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        text: "Gharr",
        children: [
          TextSpan(
            text: "For.",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
          TextSpan(text: "Sale")
        ],
      ),
    );
  }
}
