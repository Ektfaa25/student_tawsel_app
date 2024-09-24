import 'package:flutter/material.dart';

import 'package:student_tawsel/presentantion/pages/student_subject_page.dart';
import 'package:student_tawsel/presentantion/widgets/student_card_widget.dart';
import 'package:student_tawsel/student_class.dart';

class MyChildrenCardWidget extends StatelessWidget {
  final int? itemssize;

  const MyChildrenCardWidget({
    super.key,
    this.itemssize,
  });

  int _getCardCount() {
    if (itemssize != null) {
      return itemssize!;
    } else {
      return Student.studentData.length;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.only(left: 17, right: 27),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 25,
        ),
        itemCount: _getCardCount(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final student = Student.studentData[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StudentSubjectPage(
                    student: student.name,
                    subject: '',
                  ),
                ),
              );
            },
            child: StudentCardWidget(
              name: student.name,
              level: student.level,
              imagePath: student.imagePath,
            ),
          );
        });
  }
}
