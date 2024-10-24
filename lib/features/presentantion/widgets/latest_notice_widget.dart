import 'package:flutter/material.dart';
import 'package:student_tawsel/features/presentantion/widgets/latest_notices_card_content_widget.dart';
import 'package:student_tawsel/features/teacher/data/teacher_model.dart';
import 'package:student_tawsel/features/teacher/domain/teacher_repository.dart';

class LatestNoticesCardWidget extends StatefulWidget {
  final List<TeacherModel> teachers;
  const LatestNoticesCardWidget(
      {super.key, this.itemssize, required this.teachers});
  final int? itemssize;

  @override
  State<LatestNoticesCardWidget> createState() =>
      _LatestNoticesCardWidgetState();
}

class _LatestNoticesCardWidgetState extends State<LatestNoticesCardWidget> {
  final _teacherRepository = TeacherRepository();

  late Future<List<TeacherModel>> fetchteachers;

  @override
  void initState() {
    super.initState();

    fetchteachers = _teacherRepository.getAllTeachers();
  }

  int _getCardCount({required List<TeacherModel> teacher}) {
    if (widget.itemssize != null) {
      return widget.itemssize!;
    } else {
      return teacher.length;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: _getCardCount(teacher: widget.teachers),
          itemBuilder: (context, index) {
            return const LatestNoticesCardContentWidget();
          },
        ),
      ],
    );
  }
}
