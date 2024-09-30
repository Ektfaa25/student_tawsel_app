import 'package:flutter/material.dart';
import 'package:student_tawsel/exam_class.dart';
import 'package:student_tawsel/features/presentantion/pages/results_page.dart';

class ExamListWidget extends StatelessWidget {
  final List<Exam> exams;

  const ExamListWidget({
    super.key,
    required this.exams,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: exams.length,
              itemBuilder: (context, index) {
                return ExamCardWidget(
                  exam: exams[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
