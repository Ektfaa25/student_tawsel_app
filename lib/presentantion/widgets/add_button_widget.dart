import 'package:flutter/material.dart';
import 'package:student_tawsel/generated/l10n.dart';
import 'package:student_tawsel/presentantion/pages/children_page.dart';

class AddButtonWidget extends StatelessWidget {
  const AddButtonWidget({
    super.key,
    required this.nameController,
    required this.idController,
    required this.selectedLevel,
  });

  final TextEditingController nameController;
  final TextEditingController idController;
  final String? selectedLevel;

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
      margin: const EdgeInsets.only(top: 42, left: 48, right: 48, bottom: 20),
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ChildrenPage()),
          );
        },
        child: Text(S.of(context).add,
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
