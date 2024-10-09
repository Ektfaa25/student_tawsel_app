import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:student_tawsel/core/theme/app_pallete.dart';
import 'package:student_tawsel/features/auth/firebase_auth.dart';
import 'package:student_tawsel/features/messages/data/message_model.dart';
import 'package:student_tawsel/features/messages/domain/messge_repository.dart';
import 'package:student_tawsel/features/messages/presentaion/list_of_messages_widget.dart';
import 'package:student_tawsel/features/presentantion/widgets/app_bar_back_ground_widget.dart';
import 'package:student_tawsel/features/presentantion/widgets/avatar_widget.dart';

class ConversationPage extends StatefulWidget {
  final String name;
  final String profession;

  final String teacherId;

  const ConversationPage({
    super.key,
    required this.name,
    required this.profession,
    required this.teacherId,
  });

  @override
  State<ConversationPage> createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('d MMM').format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: const AppBarBackGroundWidget(
            isloginparent: false,
          ),
          title: Row(children: [
            const AvatarWidget(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    widget.name,
                    style: const TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color(0xffFCFCFC),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.profession,
                    style: const TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xffCCC8C8)),
                  ),
                ],
              ),
            ),
          ])),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                formattedDate,
                style: const TextStyle(
                    fontFamily: "Inter",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff474747)),
              ),
            ),
          ),
          Expanded(
              child: ListOfMessagesWidget(
            chatId: widget.teacherId,
            currentUserId: FirebaseAuthService().getCurrentUserid(),
          )),
          // Expanded(
          //   child: Column(
          //     children: [
          //       Expanded(
          //         child: ListView(
          //           children: const [
          //             ChatBubbleWidget(
          //               message: "Hello MR Adel",
          //               isSentByMe: true,
          //             ),
          //             ChatBubbleWidget(
          //               message: "Hello Sir",
          //               isSentByMe: false,
          //             ),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: const Color(0xffE1DDDD),
                      borderRadius: BorderRadius.circular(25)),
                  width: 372,
                  height: 60,
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: const Icon(
                          Icons.attachment_rounded,
                          color: Colors.black,
                          size: 30,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            sendMessageToTeacher(
                              FirebaseAuthService().getCurrentUserid(),
                              widget.teacherId,
                              _controller.text,
                            );
                          },
                          icon: const Icon(Icons.send,
                              color: AppPallete.primaryColor, size: 30),
                        )),
                  )),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> sendMessageToTeacher(
      String currentUserId, String chatId, String messageContent) async {
    final messageRepo = MessageRepository();

    final message = MessageModel(
      id: '',
      senderId: currentUserId,
      chatId: chatId,
      message: messageContent,
      messageType: MessageType.text,
      timestamp: DateTime.now(),
      isSentByMe: true,
    );

    await messageRepo.sendMessage(message);

    _controller.clear();
  }
}
