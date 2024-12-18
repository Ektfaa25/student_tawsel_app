import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:student_tawsel/core/theme/app_pallete.dart';
import 'package:student_tawsel/features/auth/firebase_auth.dart';
import 'package:student_tawsel/features/chat/data/chat_model.dart';
import 'package:student_tawsel/features/chat/domain/chat_repository.dart';
import 'package:student_tawsel/features/chat/presentation/chat_page.dart';
import 'package:student_tawsel/features/latest_notices/data/latest_notices_model.dart';
import 'package:student_tawsel/features/latest_notices/domain/latest_notice_repository.dart';
import 'package:student_tawsel/features/messages/data/message_model.dart';
import 'package:student_tawsel/features/teacher/data/teacher_model.dart';
import 'package:student_tawsel/features/teacher/domain/teacher_repository.dart';

class LatestNoticesCardContentWidget extends StatelessWidget {
  List<LatestNoticeModel>? latestnotice;
  LatestNoticesCardContentWidget({
    super.key,
    this.latestnotice,
  });

  @override
  Widget build(BuildContext context) {
    final TeacherRepository teacherRepository = TeacherRepository();
    final LatestNoticeRepository latestNoticeRepository =
        LatestNoticeRepository();
    // final ChatRepository chatRepository = ChatRepository();

    Future<List<TeacherModel>> fetchTeachers() async {
      return await teacherRepository.getAllTeachers();
    }

    Future<List<LatestNoticeModel>> fetchlatestnotice() async {
      return await latestNoticeRepository.getAllLatestNotices();
    }

    return FutureBuilder<List<LatestNoticeModel>>(
        future: fetchlatestnotice(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text('Error fetching data'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data available'));
          }

          final Chatdata = snapshot.data!;
          return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: Chatdata.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ChatPage(
                        fetchTeachers: fetchTeachers(),
                      );
                    }));
                  },
                  child: Card(
                    color: AppPallete.secondaryColor,
                    margin: const EdgeInsets.only(
                      left: 18,
                      right: 19,
                      top: 18,
                    ),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 12, top: 14, bottom: 17),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(Chatdata[index].teacherName,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xff2D2828),
                                      )),
                              const SizedBox(height: 8),
                              Text(
                                  '${Chatdata[index].profession}\n${Chatdata[index].additionalInfo}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        fontWeight: FontWeight.w400,
                                      )),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Message",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.w300,
                                      decoration: TextDecoration.underline,
                                      color: const Color(0xff2D2828),
                                    ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                Chatdata[index].lastMessageContent,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10,
                                        color: const Color(0xff2D2828)),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
        });
  }
}
