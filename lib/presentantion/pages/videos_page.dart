import 'package:flutter/material.dart';
import 'package:student_tawsel/generated/l10n.dart';
import 'package:student_tawsel/presentantion/pages/home_page.dart';
import 'package:student_tawsel/presentantion/widgets/avatar_widget.dart';
import 'package:student_tawsel/presentantion/widgets/button_selection_widget.dart';
import 'package:student_tawsel/presentantion/widgets/pop_up_menu_widget.dart';
import 'package:student_tawsel/presentantion/widgets/video_card_widget.dart';
import 'package:student_tawsel/student_class.dart';

class VideosPage extends StatelessWidget {
  final String student;

  final String subject;
  const VideosPage({super.key, required this.student, required this.subject});

  @override
  Widget build(BuildContext context) {
    final List<String> subjects = [
      S.of(context).subjectScience,
      S.of(context).subjectEnglish,
      S.of(context).subjectArabic,
      S.of(context).subjectMath,
      S.of(context).subjectDrawing,
      S.of(context).subjectComputer,
      S.of(context).subjectAccount,
      S.of(context).subjectMath,
      S.of(context).subjectFrench,
    ];

    final List<String> menuItems = [
      S.of(context).menuTeachers,
      S.of(context).menuAttendance,
      S.of(context).menuAssignments,
      S.of(context).menuTimeTable,
      S.of(context).menuExams,
      S.of(context).menuResults,
    ];

    final List<String> menuImgs = [
      "assets/icongroup.png",
      "assets/ icon _iris scan_.png",
      "assets/ icon _book stack_.png",
      "assets/icon _alarm_.png",
      "assets/ icon _page edit_.png",
      "assets/icon _printer alt_.png",
    ];
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
          PopUpMenuWidget(menuItems: menuItems, menuImgs: menuImgs),
        ],
      ),
      body: Column(
        children: [
          ButtonSelectionWidget(
            btnSelectone: "Files",
            btnSelecttwo: "Videos",
            isSelectedfirst: false,
            student: student,
            subject: subject,
          ),
          VideoCardWidget(student: student),
        ],
      ),
    );
  }
}
