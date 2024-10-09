import 'package:flutter/material.dart';
import 'package:student_tawsel/features/presentantion/pages/assignments_page.dart';
import 'package:student_tawsel/features/presentantion/pages/attendance_page.dart';
import 'package:student_tawsel/features/presentantion/pages/exams_online_page.dart';
import 'package:student_tawsel/features/presentantion/pages/results_page.dart';
import 'package:student_tawsel/features/subjects/presentation/student_subject_page.dart';
import 'package:student_tawsel/features/teacher/presentation/teachers_page.dart';
import 'package:student_tawsel/features/presentantion/pages/time_table_page.dart';

class PopUpMenuWidget extends StatelessWidget {
  const PopUpMenuWidget({
    super.key,
    required this.menuItems,
    required this.menuImgs,
  });

  final List<String> menuItems;
  final List<String> menuImgs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(17),
      child: PopupMenuButton(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(27),
              bottomLeft: Radius.circular(27),
              bottomRight: Radius.circular(27),
            ),
          ),
          color: Colors.white.withOpacity(0.85),
          icon: Image.asset("assets/menu.png"),
          onSelected: (item) => onSelected(context, item),
          itemBuilder: (context) => List.generate(
                menuItems.length,
                (index) => PopupMenuItem(
                  padding: const EdgeInsets.all(8),
                  value: index,
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Color(0xff130F44)),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 40,
                        backgroundColor: const Color(0xff182243),
                        child: Image.asset(menuImgs[index],
                            width: 34, height: 34, fit: BoxFit.contain),
                      ),
                      title: Text(
                        menuItems[index],
                        style: const TextStyle(
                          color: Color(0xff130F44),
                          fontFamily: "Inter",
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 21,
                        color: Color(0xff656060),
                      ),
                    ),
                  ),
                ),
              )),
    );
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
}
