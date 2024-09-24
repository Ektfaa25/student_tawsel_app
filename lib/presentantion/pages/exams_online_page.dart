import 'package:flutter/material.dart';

import 'package:student_tawsel/generated/l10n.dart';
import 'package:student_tawsel/presentantion/widgets/app_bar_back_ground_widget.dart';
import 'package:student_tawsel/presentantion/widgets/button_selection_widget.dart';
import 'package:student_tawsel/presentantion/widgets/exam_card_widget.dart';

class ExamsOnlinePage extends StatelessWidget {
  const ExamsOnlinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: const AppBarBackGroundWidget(),
        title: Text(
          S.of(context).exams,
        ),
      ),
      body: Column(
        children: [
          ButtonSelectionWidget(
            btnSelectone: S.of(context).offline,
            btnSelecttwo: S.of(context).online,
            isSelectedfirst: false,
            subject: "",
            student: '',
          ),
          SizedBox(
            height: 26,
          ),
          ExamCardWidget(),
        ],
      ),
    );
  }
}
