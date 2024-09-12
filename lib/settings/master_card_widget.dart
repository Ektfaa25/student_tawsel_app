import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MasterCardWidget extends StatelessWidget {
  const MasterCardWidget({
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
        color: const Color(0xff222222),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Positioned(
              right: 288,
              left: 24,
              top: 34,
              child: Image.asset("assets/chip.png")),
          const Positioned(
            top: 79,
            bottom: 115,
            right: 76,
            left: 75,
            child: Text(
              "* * * *  * * * *  * * * *  3947",
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontFamily: "Tajawal",
                  color: Colors.white,
                  fontSize: 16),
            ),
          ),
          Positioned(
              top: 150,
              right: 25,
              left: 287,
              child: Image.asset("assets/mastercard.png")),
          SvgPicture.asset("assets/Ellipse.svg"),
          const Positioned(
            top: 152,
            right: 100,
            left: 38,
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
                      "05/23",
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
