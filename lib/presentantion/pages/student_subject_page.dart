import 'package:flutter/material.dart';
import 'package:student_tawsel/presentantion/pages/assignments_page.dart';
import 'package:student_tawsel/presentantion/pages/attendance_page.dart';
import 'package:student_tawsel/presentantion/pages/exams_online_page.dart';
import 'package:student_tawsel/generated/l10n.dart';
import 'package:student_tawsel/presentantion/pages/home_page.dart';
import 'package:student_tawsel/presentantion/widgets/button_selection_widget.dart';
import 'package:student_tawsel/presentantion/widgets/pop_up_menu_widget.dart';
import 'package:student_tawsel/student_class.dart';
import 'package:student_tawsel/presentantion/pages/results_page.dart';
import 'package:student_tawsel/presentantion/pages/teachers_page.dart';
import 'package:student_tawsel/presentantion/pages/time_table_page.dart';

class StudentSubjectPage extends StatelessWidget {
  StudentSubjectPage({
    super.key,
    required this.student,
  });
  final Student student;
  final List<String> images = [
    "assets/science.png",
    "assets/english.png",
    "assets/arabic.png",
    "assets/math.png",
    "assets/drawing.png",
    "assets/computer.png",
    "assets/account.png",
    "assets/math2.png",
    "assets/french.png",
  ];

  final List<String> menuImgs = [
    "assets/icongroup.png",
    "assets/ icon _iris scan_.png",
    "assets/ icon _book stack_.png",
    "assets/icon _alarm_.png",
    "assets/ icon _page edit_.png",
    "assets/icon _printer alt_.png",
  ];

  @override
  Widget build(BuildContext context) {
    final List<String> menuItems = [
      S.of(context).menuTeachers,
      S.of(context).menuAttendance,
      S.of(context).menuAssignments,
      S.of(context).menuTimeTable,
      S.of(context).menuExams,
      S.of(context).menuResults,
    ];

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
                student.name,
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
            isSelectedfirst: true,
            btnSelectone: 'Subjects',
            btnSelecttwo: 'Tracking',
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
                    print("subject pressde");
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
                          style: const TextStyle(
                              fontFamily: "Inter",
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff3F3D3D))),
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
