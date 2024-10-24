import 'package:flutter/material.dart';
import 'package:student_tawsel/features/auth/data/user_model.dart';
import 'package:student_tawsel/features/auth/domain/repository/user_repo.dart';
import 'package:student_tawsel/features/auth/firebase_auth.dart';
import 'package:student_tawsel/features/chat/domain/chat_repository.dart';
import 'package:student_tawsel/features/messages/domain/messge_repository.dart';

import 'package:student_tawsel/features/chat/presentation/convo_page.dart';
import 'package:student_tawsel/features/teacher/data/teacher_model.dart';
import 'package:student_tawsel/generated/l10n.dart';

class ChatPage extends StatefulWidget {
  final Future<List<TeacherModel>> fetchTeachers;
  const ChatPage({
    super.key,
    required this.fetchTeachers,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late Future<List<UserModel>> users;
  @override
  void initState() {
    super.initState();

    users = UserRepository().getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          // flexibleSpace: const AppBarBackGroundWidget(),
          title: Text(
            S.of(context).chat,
          ),
        ),
        body: FutureBuilder<List<TeacherModel>>(
            future: widget.fetchTeachers,
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
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: teachers.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
                        final chatId = await startChatWithTeacher(
                          FirebaseAuthService().getCurrentUserid(),
                          teachers[index].id!,
                        );
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ConversationPage(
                                  teacherId: chatId,
                                  name: teachers[index].name,
                                  profession: teachers[index].profession),
                            ));
                      },
                      child: Card(
                        color: const Color(0xffF6F6F6),
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
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        width: 96,
                                        height: 92,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 2,
                                          ),
                                        ),
                                      ),
                                      ClipOval(
                                        child: Container(
                                          color: Colors.grey[300],
                                          child: GestureDetector(
                                            child: Image.asset(
                                                "assets/smiling-face-of-a-child-2 1.png",
                                                width: 75,
                                                height: 77,
                                                fit: BoxFit.contain),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    teachers[index].name,
                                    style: const TextStyle(
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      teachers[index].profession,
                                      style: const TextStyle(
                                        fontFamily: "Inter",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(height: 47),
                                    const Text(
                                      "24  Mar",
                                      style: TextStyle(
                                        fontFamily: "Inter",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            }));
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
