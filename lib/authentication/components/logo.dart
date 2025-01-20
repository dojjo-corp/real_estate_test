import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // textBaseline: TextBaseline.alphabetic,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Icon(
          Icons.home_work_rounded,
          size: 40,
          color: Theme.of(context).primaryColor,
        ),
        const SizedBox(width: 1,),
        RichText(
          text: TextSpan(
            style: const TextStyle(
              fontSize: 25,
              color: Colors.black87,
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
        ),
      ],
    );
  }
}
