import 'package:flutter/material.dart';

class AppBarBackGroundWidget extends StatelessWidget {
  const AppBarBackGroundWidget({super.key, required this.isloginparent});
  final bool isloginparent;

  @override
  Widget build(BuildContext context) {
    return isloginparent
        ? Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                right: 0,
                top: 0,
                child: Image.asset(
                  "assets/loginparentabstact.png",
                  height: 200,
                ),
              ),
            ],
          )
        : Stack(
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
