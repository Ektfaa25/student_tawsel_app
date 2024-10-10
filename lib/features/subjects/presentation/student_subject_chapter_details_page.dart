import 'package:flutter/material.dart';
import 'package:student_tawsel/popup_menu_data.dart';
import 'package:student_tawsel/features/presentantion/widgets/avatar_widget.dart';
import 'package:student_tawsel/features/presentantion/widgets/button_selection_widget.dart';
import 'package:student_tawsel/features/presentantion/widgets/chapter_details_cards_widget.dart';
import 'package:student_tawsel/features/presentantion/widgets/pop_up_menu_widget.dart';

class StudentSubjectChapterDetailsPage extends StatefulWidget {
  final String? pdfurl;
  final String student;
  final String pdfname;
  const StudentSubjectChapterDetailsPage(
      {super.key,
      required this.pdfurl,
      required this.student,
      required this.pdfname});

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
          ButtonSelectionWidget(
              studentname: widget.student,
              btnSelectone: "Files",
              btnSelecttwo: "Videos",
              isSelectedfirst: true),
          const SizedBox(
            height: 26,
          ),
          ChapterDetailsCardsWidget(
            pdfurl: widget.pdfurl,
            pdfname: widget.pdfname,
            isicon: true,
            isannouncement: false,
          ),
        ],
      ),
    );
  }
}
