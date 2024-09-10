import 'package:flutter/material.dart';

import 'package:student_tawsel/generated/l10n.dart';

class TeachersPage extends StatelessWidget {
  const TeachersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 139,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(22),
              bottomRight: Radius.circular(22),
            ),
          ),
          backgroundColor: const Color(0xff182243),
          elevation: 0,
          centerTitle: true,
          title: Text(
            S.of(context).teachers,
            style: const TextStyle(
              fontFamily: "Inter",
              fontWeight: FontWeight.bold,
              fontSize: 32,
              color: Colors.white,
            ),
          )),
    );
  }
}
