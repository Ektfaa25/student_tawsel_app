import 'package:flutter/material.dart';
import 'package:student_tawsel/features/presentantion/widgets/latest_notices_card_content_widget.dart';
import 'package:student_tawsel/features/teacher/data/teacher_model.dart';

import 'package:student_tawsel/tacher_class.dart';

class LatestNoticesCardWidget extends StatelessWidget {
  final List<TeacherModel> teachers;
  const LatestNoticesCardWidget(
      {super.key, this.itemssize, required this.teachers});
  final int? itemssize;

  _getCardcount() {
    if (itemssize != null) {
      return itemssize;
    } else {
      return teachers.length;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: _getCardcount(),
          itemBuilder: (context, index) {
            return LatestNoticesCardContentWidget(
           
            );
          },
        ),
      ],
    );
  }
}
