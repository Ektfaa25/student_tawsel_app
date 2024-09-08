import 'package:flutter/material.dart';
import 'package:student_tawsel/assignments_page.dart';
import 'package:student_tawsel/attendance_page.dart';
import 'package:student_tawsel/exams_online_page.dart';

import 'package:student_tawsel/homepage/home_page.dart';
import 'package:student_tawsel/homepage/student_class.dart';
import 'package:student_tawsel/result/results_page.dart';
import 'package:student_tawsel/teachers_page.dart';
import 'package:student_tawsel/time_table_page.dart';

class StudentSubject extends StatelessWidget {
  StudentSubject({
    super.key,
    required this.student,
  });

  final Student student;
  List<String> images = [
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

  List<String> subject = [
    "Science",
    "English",
    "Arabic",
    "Math",
    "Drawing",
    "Computer",
    "Account",
    "Math",
    "French",
  ];
  final List<String> menuItems = [
    'Teachers',
    'Attendance',
    'Assignments',
    'Time Table',
    'Exams',
    'Results'
  ];
  final List<String> menuImgs = [
    "assets/icon _group_.png",
    "assets/ icon _iris scan_.png",
    "assets/ icon _book stack_.png",
    "assets/icon _alarm_.png",
    "assets/ icon _page edit_.png",
    "assets/icon _printer alt_.png",
  ];

  @override
  Widget build(BuildContext context) {
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
          Padding(
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
          ),
        ],
      ),
      body: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
              width: 151,
              height: 56,
              margin: const EdgeInsets.all(15),
              child: ElevatedButton(
                  style: const ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    backgroundColor: WidgetStatePropertyAll(Color(0xff182243)),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Subjects",
                    style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
            ),
            Container(
              width: 151,
              height: 56,
              margin: const EdgeInsets.all(8),
              child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.white),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        side: BorderSide(color: Color(0xff182243)),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Tracking",
                    style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff3F3D3D)),
                  )),
            ),
          ]),
          const SizedBox(height: 68),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: images.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
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
                    Text(subject[index],
                        style: const TextStyle(
                            fontFamily: "Inter",
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff3F3D3D))),
                  ],
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
        MaterialPageRoute(builder: (context) => const ExamsPage()),
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
