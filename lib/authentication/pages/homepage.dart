import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: kToolbarHeight,
                left: 15,
                right: 15,
                bottom: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Let's find your",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize:
                              Theme.of(context).textTheme.bodyLarge!.fontSize,
                        ),
                      ),
                      Text(
                        "Favorite Home",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize:
                              Theme.of(context).textTheme.bodyLarge!.fontSize,
                        ),
                      )
                    ],
                  ),
                  CircleAvatar(
                    foregroundImage: AssetImage("assets/profile_man.jpg"),
                    radius: 20,
                  )
                ],
              ),
            ),

            // todo: Search bar
          ],
        ),
      ),
    );
  }
}
