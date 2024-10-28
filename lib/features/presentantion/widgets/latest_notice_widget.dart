import 'package:flutter/material.dart';
import 'package:student_tawsel/features/chat/data/chat_model.dart';
import 'package:student_tawsel/features/latest_notices/data/latest_notices_model.dart';
import 'package:student_tawsel/features/latest_notices/domain/latest_notice_repository.dart';
import 'package:student_tawsel/features/messages/data/message_model.dart';
import 'package:student_tawsel/features/presentantion/widgets/latest_notices_card_content_widget.dart';
import 'package:student_tawsel/features/teacher/data/teacher_model.dart';
import 'package:student_tawsel/features/teacher/domain/teacher_repository.dart';

class LatestNoticesCardWidget extends StatefulWidget {
  List<LatestNoticeModel> latestnotices;
  LatestNoticesCardWidget(
      {super.key, this.itemssize, required this.latestnotices});
  final int? itemssize;

  @override
  State<LatestNoticesCardWidget> createState() =>
      _LatestNoticesCardWidgetState();
}

class _LatestNoticesCardWidgetState extends State<LatestNoticesCardWidget> {
  final LatestNoticeRepository _latestNoticeRepository =
      LatestNoticeRepository();

  late Future<List<TeacherModel>> fetchteachers;

  @override
  void initState() {
    super.initState();

    // fetchteachers = _teacherRepository.getAllTeachers();
  }

  int _getCardCount({required List<LatestNoticeModel> messages}) {
    if (widget.itemssize != null) {
      return widget.itemssize!;
    } else {
      return messages.length;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: _getCardCount(messages: widget.latestnotices),
          itemBuilder: (context, index) {
            return LatestNoticesCardContentWidget(
              latestnotice: widget.latestnotices,
            );
          },
        ),
      ],
    );
  }
}
