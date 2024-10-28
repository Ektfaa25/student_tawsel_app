import 'package:flutter/material.dart';
import 'package:student_tawsel/features/auth/firebase_auth.dart';
import 'package:student_tawsel/features/chat/domain/chat_repository.dart';
import 'package:student_tawsel/features/chat/presentation/convo_page.dart';
import 'package:student_tawsel/features/presentantion/widgets/avatar_widget.dart';
import 'package:student_tawsel/features/teacher/data/teacher_model.dart';
import 'package:student_tawsel/features/teacher/domain/teacher_repository.dart';

import 'package:student_tawsel/generated/l10n.dart';

class TeachersPage extends StatefulWidget {
  const TeachersPage({super.key});

  @override
  State<TeachersPage> createState() => _TeachersPageState();
}

class _TeachersPageState extends State<TeachersPage> {
  final TeacherRepository teachersRepo = TeacherRepository();

  Future<List<TeacherModel>>? teacher;

  @override
  void initState() {
    super.initState();
    //  TeacherRepository().addAllTeachersToFirestore();
    teacher = teachersRepo.getAllTeachers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          // flexibleSpace: const AppBarBackGroundWidget(),
          title: Text(
            S.of(context).teachers,
          )),
      body: FutureBuilder<List<TeacherModel>>(
        future: teacher,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator()); // Loading spinner
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No children found.'));
          } else {
            // The data is available and we can build the list
            final teachers = snapshot.data!;
            return ListView.builder(
              itemCount: teachers.length,
              itemBuilder: (context, index) {
                final teacher = teachers[index];
                return Card(
                  color: const Color(0xffF6F6F6),
                  margin: const EdgeInsets.only(
                    left: 20,
                    right: 19,
                    top: 20,
                  ),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 15, right: 30, top: 14, bottom: 17),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const AvatarWidget(),
                            const SizedBox(height: 30),
                            GestureDetector(
                              onTap: () async {
                                final chatId = await startChatWithTeacher(
                                  FirebaseAuthService().getCurrentUserid(),
                                  teachers[index].id,
                                );
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return ConversationPage(
                                      teacherId: teachers[index].id,
                                      name: teacher.name,
                                      profession: teacher.profession,
                                      chatid: chatId);
                                }));
                              },
                              child: Image.asset(
                                "assets/icon _chat_lines_.png",
                                color: const Color(0xff3A3A3A),
                              ),
                            ),

                            // Text(
                            //   "  Level : ${child.level}",
                            //   style: const TextStyle(
                            //       fontFamily: "Inter",
                            //       fontSize: 20,
                            //       fontWeight: FontWeight.bold,
                            //       color: Color(0xff2D2D2D)),
                            // ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '${teacher.name}',
                              style: const TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff2D2D2D)),
                            ),
                            Text(
                              '${teacher.profession}',
                              style: const TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff2D2D2D)),
                            ),
                            const SizedBox(height: 40),
                            Row(
                              children: [
                                const Icon(Icons.call),
                                Text(
                                  " ${teacher.phonenumer}",
                                  style: const TextStyle(
                                      fontFamily: "Inter",
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff2D2D2D)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  Future<String> startChatWithTeacher(
    String currentUserId,
    String teacherId,
  ) async {
    final chatRepo = ChatRepository();

    final chat = await chatRepo.getOrCreateChat(teacherId);

    print('Chat started with ID: ${chat}');
    return chat;
  }
}
