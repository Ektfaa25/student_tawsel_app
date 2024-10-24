import 'package:flutter/material.dart';
import 'package:student_tawsel/core/theme/app_pallete.dart';
import 'package:student_tawsel/features/chat/presentation/chat_page.dart';
import 'package:student_tawsel/features/teacher/data/teacher_model.dart';
import 'package:student_tawsel/features/teacher/domain/teacher_repository.dart';

class LatestNoticesCardContentWidget extends StatelessWidget {
  const LatestNoticesCardContentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TeacherRepository teacherRepository = TeacherRepository();

    Future<List<TeacherModel>> fetchTeachers() async {
      return await teacherRepository.getAllTeachers();
    }

    return FutureBuilder<List<TeacherModel>>(
        future: fetchTeachers(),
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

          // List of teachers from Firestore
          final teacherData = snapshot.data!;
          return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: teacherData.length,
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
                              Text(teacherData[index].name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xff2D2828),
                                      )),
                              const SizedBox(height: 8),
                              Text(
                                  '${teacherData[index].profession}\n${teacherData[index].additionalInfo}',
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
                                'Message',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                        fontWeight: FontWeight.w300,
                                        decoration: TextDecoration.underline,
                                        color: const Color(0xff2D2828)),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                teacherData[index].message,
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
