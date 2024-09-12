import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VisaCardWidget extends StatelessWidget {
  const VisaCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 216,
      width: 343,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color(0x3f000000),
            offset: Offset(0, 4),
            blurRadius: 20,
            spreadRadius: 0,
          )
        ],
        color: const Color(0xff9B9B9B),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Positioned(
            top: 19,
            left: 269,
            right: 25,
            child: Image.asset("assets/visa.png"),
          ),
          const Positioned(
            top: 79,
            bottom: 115,
            right: 76,
            child: Text(
              "* * * *  * * * *  * * * *  3947",
              style: TextStyle(
                  fontFamily: "Tajawal", color: Colors.white, fontSize: 16),
            ),
          ),
          Positioned(
              right: 288,
              left: 24,
              top: 100,
              child: Image.asset("assets/chip.png")),
          SvgPicture.asset("assets/Ellipse.svg"),
          const Positioned(
            top: 152,
            right: 35,
            left: 35,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "Card Holder Name",
                      style: TextStyle(
                          fontFamily: "Tajawal",
                          color: Colors.white,
                          fontSize: 10),
                    ),
                    Text(
                      "Jennyfer Doe",
                      style: TextStyle(
                          fontFamily: "Tajawal",
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Expiry Date",
                      style: TextStyle(
                          fontFamily: "Tajawal",
                          color: Colors.white,
                          fontSize: 10),
                    ),
                    Text(
                      "11/22",
                      style: TextStyle(
                          fontFamily: "Tajawal",
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 107,
            right: 64,
            child: Image.asset("assets/Vector.png"),
          )
        ],
      ),
    );
  }
}
