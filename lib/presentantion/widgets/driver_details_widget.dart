import 'package:flutter/material.dart';
import 'package:student_tawsel/presentantion/widgets/avatar_widget.dart';

class DriverDetailsWidget extends StatelessWidget {
  const DriverDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: 360,
          height: 218,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xffF6F6F6),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Stack(
            children: [
              const Positioned(
                top: 10,
                left: 200,
                child: AvatarWidget(),
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text("Mahmoud",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                    )),
                RichText(
                    text: const TextSpan(
                        text: "Nationality : ",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        children: <InlineSpan>[
                      TextSpan(
                        text: "Yemen",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ])),
                const Text("ID : 25637 ",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                    )),
                const Text("License : 77858 ",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                    )),
                const Text("Phone : 056673674 ",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                    )),
              ]),
            ],
          )),
    );
  }
}
