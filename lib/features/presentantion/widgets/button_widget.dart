import 'package:flutter/material.dart';
import 'package:student_tawsel/features/add_child/data/child_model.dart';
import 'package:student_tawsel/features/add_child/domain/child_repo.dart';
import 'package:student_tawsel/generated/l10n.dart';
import 'package:student_tawsel/features/add_child/presentation/children_page.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget({
    super.key,
    this.controller,
    required this.label,
    required this.onPressed,
  });
  final String label;
  final TextEditingController? controller;

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 61,
      width: 300,
      decoration: const BoxDecoration(
        color: Color(0xff182243),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      margin: const EdgeInsets.only(top: 20, left: 48, right: 48, bottom: 0),
      child: TextButton(
        onPressed: onPressed,
        child: Text(label,
            style: const TextStyle(
              fontFamily: "Inter",
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),
      ),
    );
  }
}
