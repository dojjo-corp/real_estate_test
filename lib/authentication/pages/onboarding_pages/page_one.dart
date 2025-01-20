import 'package:flutter/material.dart';
import 'package:real_estate_test/global/constants.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key, required this.imageAssetName});

  final String imageAssetName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          imageAssetName,
          height: deviceHeight(context) * 0.4,
          width: deviceWidth(context),
          fit: BoxFit.cover,
        ),

        // todo: Rich Text with differing cooloring
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Theme.of(context).textTheme.headlineMedium!.fontSize,
            ),
            text: "Lorem ",
            children: [
              TextSpan(
                text: "Ipsum Is Simply",
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              TextSpan(text: "dummy text printing")
            ],
          ),
        ),

        Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
