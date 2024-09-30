import 'package:flutter/material.dart';

class AppBarBackGroundWidget extends StatelessWidget {
  const AppBarBackGroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          right: 0,
          top: 0,
          child: Image.asset(
            "assets/pngtreeabstractbluepastelblob.png",
            height: 200,
          ),
        ),
      ],
    );
  }
}
