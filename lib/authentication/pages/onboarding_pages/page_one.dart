import 'package:flutter/material.dart';
import 'package:real_estate_test/global/constants.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key, required this.imageAssetName});

  final String imageAssetName;

  @override
  Widget build(BuildContext context) {
   

    return SizedBox(
      height: deviceHeight(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imageAssetName,
            height: deviceHeight(context) * 0.4,
            width: deviceWidth(context),
            fit: BoxFit.cover,
          ),
    
          const SizedBox(height: 20),
    
          // todo: Rich Text with differing cooloring
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .fontSize,
                        color: Colors.black87,
                      ),
                      text: "Lorem ",
                      children: [
                        TextSpan(
                          text: "Ipsum is simply ",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor),
                        ),
                        TextSpan(text: "dummy text printing")
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                    style: TextStyle(color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
