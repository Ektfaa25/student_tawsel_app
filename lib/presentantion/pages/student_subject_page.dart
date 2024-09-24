import 'package:flutter/material.dart';
import 'package:student_tawsel/popup_menu_data.dart';
import 'package:student_tawsel/presentantion/pages/assignments_page.dart';
import 'package:student_tawsel/presentantion/pages/attendance_page.dart';
import 'package:student_tawsel/presentantion/pages/exams_online_page.dart';
import 'package:student_tawsel/generated/l10n.dart';
import 'package:student_tawsel/presentantion/pages/student_subject_chapters_page.dart';
import 'package:student_tawsel/presentantion/widgets/app_bar_back_ground_widget.dart';
import 'package:student_tawsel/presentantion/widgets/avatar_widget.dart';
import 'package:student_tawsel/presentantion/widgets/button_selection_widget.dart';
import 'package:student_tawsel/presentantion/widgets/pop_up_menu_widget.dart';
import 'package:student_tawsel/presentantion/pages/results_page.dart';
import 'package:student_tawsel/presentantion/pages/teachers_page.dart';
import 'package:student_tawsel/presentantion/pages/time_table_page.dart';

class StudentSubjectPage extends StatelessWidget {
  const StudentSubjectPage({
    super.key,
    required this.student,
    required this.subject,
  });
  final String student;
  final String subject;

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
                style: Theme.of(context).textTheme.titleMedium?.copyWith(),
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
            student: student,
            subject: subject,
            isSelectedfirst: true,
            btnSelectone: S.of(context).subjects,
            btnSelecttwo: S.of(context).tracking,
          ),
          const SizedBox(height: 68),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: images.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StudentSubjectChaptersPage(
                                  subject: subjects[index],
                                  student: student,
                                )));
                  },
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(19)),
                        ),
                        height: 90,
                        width: 109,
                        child: Image.asset(images[index]),
                      ),
                      const SizedBox(height: 10),
                      Text(subjects[index],
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith()),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void onSelected(BuildContext context, int item) {
  switch (item) {
    case 0:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TeachersPage()),
      );
      break;
    case 1:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AttendancePage()),
      );
      break;
    case 2:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AssignmentsPage()),
      );

      break;
    case 3:
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TimeTablePage()),
      );
      break;
    case 4:
      //exams page implementation done here
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ExamsOnlinePage()),
      );
      break;
    case 5:
      //results page implementation done here
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ResultsPage()),
      );
      break;
  }
}
