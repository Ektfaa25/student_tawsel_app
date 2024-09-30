import 'package:flutter/material.dart';
import 'package:student_tawsel/popup_menu_data.dart';
import 'package:student_tawsel/features/presentantion/widgets/app_bar_back_ground_widget.dart';

import 'package:student_tawsel/features/presentantion/widgets/avatar_widget.dart';
import 'package:student_tawsel/features/presentantion/widgets/button_selection_widget.dart';
import 'package:student_tawsel/features/presentantion/widgets/chapter_card_widget.dart';
import 'package:student_tawsel/features/presentantion/widgets/pop_up_menu_widget.dart';

class StudentSubjectChaptersPage extends StatelessWidget {
  final String student;

  final String subject;

  const StudentSubjectChaptersPage(
      {super.key, required this.student, required this.subject});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: const AppBarBackGroundWidget(),
        title: Row(
          children: [
            const AvatarWidget(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                student,
                style: const TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        actions: [
          PopUpMenuWidget(menuItems: menuItems(context), menuImgs: menuImgs),
        ],
      ),
      body: Column(
        children: [
          ButtonSelectionWidget(
              subject: subject,
              student: student,
              btnSelectone: "Chapters",
              btnSelecttwo: "Announcements",
              isSelectedfirst: true),
          const SizedBox(
            height: 26,
          ),
          ChapterCardWidget(subject: subject, student: student)
        ],
      ),
    );
  }
}
