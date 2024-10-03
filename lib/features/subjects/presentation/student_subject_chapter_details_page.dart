import 'package:flutter/material.dart';

import 'package:student_tawsel/popup_menu_data.dart';

import 'package:student_tawsel/features/presentantion/widgets/avatar_widget.dart';
import 'package:student_tawsel/features/presentantion/widgets/button_selection_widget.dart';

import 'package:student_tawsel/features/presentantion/widgets/chapter_details_cards_widget.dart';
import 'package:student_tawsel/features/presentantion/widgets/pop_up_menu_widget.dart';

class StudentSubjectChapterDetailsPage extends StatelessWidget {
  final String student;

  final String subject;

  const StudentSubjectChapterDetailsPage(
      {super.key, required this.student, required this.subject});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
              btnSelectone: "Files",
              btnSelecttwo: "Videos",
              isSelectedfirst: true),
          const SizedBox(
            height: 26,
          ),
          const ChapterDetailsCardsWidget(
            isicon: true,
            isannouncement: false,
          ),
        ],
      ),
    );
  }
}
