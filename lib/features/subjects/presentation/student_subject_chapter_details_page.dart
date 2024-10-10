import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:student_tawsel/features/subjects/data/pdf_model.dart';
import 'package:student_tawsel/features/subjects/presentation/student_subject_chapters_page.dart';

import 'package:student_tawsel/popup_menu_data.dart';

import 'package:student_tawsel/features/presentantion/widgets/avatar_widget.dart';
import 'package:student_tawsel/features/presentantion/widgets/button_selection_widget.dart';

import 'package:student_tawsel/features/presentantion/widgets/chapter_details_cards_widget.dart';
import 'package:student_tawsel/features/presentantion/widgets/pop_up_menu_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class StudentSubjectChapterDetailsPage extends StatefulWidget {
  List<PDFModel> pdfs;
  String student;
  StudentSubjectChapterDetailsPage(
      {super.key, required this.pdfs, required this.student});

  @override
  State<StudentSubjectChapterDetailsPage> createState() =>
      _StudentSubjectChapterDetailsPageState();
}

class _StudentSubjectChapterDetailsPageState
    extends State<StudentSubjectChapterDetailsPage> {
  @override
  void initState() {
    super.initState();
  }

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
                widget.student,
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
          const ButtonSelectionWidget(
              btnSelectone: "Files",
              btnSelecttwo: "Videos",
              isSelectedfirst: true),
          const SizedBox(
            height: 26,
          ),
          ChapterDetailsCardsWidget(
            pdfs: widget.pdfs,
            isicon: true,
            isannouncement: false,
          ),
        ],
      ),
    );
  }
}
