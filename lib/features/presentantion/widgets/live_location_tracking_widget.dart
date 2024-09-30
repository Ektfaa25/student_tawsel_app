import 'package:flutter/material.dart';

class LiveLocationTrackingWidget extends StatelessWidget {
  const LiveLocationTrackingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Live Location",
            style: TextStyle(
              fontFamily: "Inter",
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
            )),
        const SizedBox(height: 26),
        Image.asset("assets/livelocation.png"),
      ],
    );
  }
}
