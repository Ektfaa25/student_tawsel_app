import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 96,
          height: 92,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
          ),
        ),
        ClipOval(
          child: Container(
            color: Colors.grey[300],
            child: Image.asset("assets/smiling-face-of-a-child-2 1.png",
                width: 75, height: 77, fit: BoxFit.contain),
          ),
        ),
        Positioned(
            top: 100, right: 0, bottom: 0, child: Icon(Icons.person, size: 96)),
      ],
    );
  }
}
