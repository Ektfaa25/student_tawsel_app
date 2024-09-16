import 'package:flutter/material.dart';

class ButtonSelectionWidget extends StatelessWidget {
  final String btnSelectone;
  final String btnSelecttwo;
  bool isSelectedfirst = false;

  ButtonSelectionWidget({
    Key? key,
    required this.btnSelectone,
    required this.btnSelecttwo,
    required this.isSelectedfirst,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Container(
        width: 151,
        height: 56,
        margin: const EdgeInsets.all(15),
        child: ElevatedButton(
            style: ButtonStyle(
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  side: BorderSide(
                      color: isSelectedfirst
                          ? Colors.transparent
                          : const Color(0xff182243)),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
              ),
              backgroundColor: isSelectedfirst
                  ? const WidgetStatePropertyAll(Color(0xff182243))
                  : const WidgetStatePropertyAll(Colors.white),
            ),
            onPressed: () {},
            child: Text(btnSelectone,
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color:
                      isSelectedfirst ? Colors.white : const Color(0xff3F3D3D),
                ))),
      ),
      Container(
        width: 151,
        height: 56,
        margin: const EdgeInsets.all(8),
        child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: isSelectedfirst
                  ? const WidgetStatePropertyAll(Colors.white)
                  : const WidgetStatePropertyAll(Color(0xff182243)),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  side: BorderSide(
                    color: isSelectedfirst
                        ? const Color(0xff182243)
                        : Colors.transparent,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            onPressed: () {},
            child: Text(
              btnSelecttwo,
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isSelectedfirst ? const Color(0xff3F3D3D) : Colors.white,
              ),
            )),
      ),
    ]);
  }
}
