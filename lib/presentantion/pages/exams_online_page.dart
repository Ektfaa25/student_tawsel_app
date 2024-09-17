import 'package:flutter/material.dart';

import 'package:student_tawsel/generated/l10n.dart';
import 'package:student_tawsel/presentantion/widgets/exam_card_widget.dart';

class ExamsOnlinePage extends StatelessWidget {
  const ExamsOnlinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(22),
            bottomRight: Radius.circular(22),
          ),
        ),
        toolbarHeight: 139,
        automaticallyImplyLeading: false,
        title: Text(
          S.of(context).exams,
          style: const TextStyle(
            fontFamily: "Inter",
            fontWeight: FontWeight.bold,
            fontSize: 32,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff182243),
      ),
      body: const Column(
        children: [
          // ButtonSelectionWidget(

          //   btnSelectone: S.of(context).offline,
          //   btnSelecttwo: S.of(context).online,
          //   isSelectedfirst: false,

          //   subject: "",
          // ),
          SizedBox(
            height: 26,
          ),
          ExamCardWidget(),
        ],
      ),
    );
  }
}
