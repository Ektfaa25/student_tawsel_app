import 'package:flutter/material.dart';
import 'package:student_tawsel/core/theme/app_pallete.dart';
import 'package:student_tawsel/features/auth/firebase_auth.dart';
import 'package:student_tawsel/features/messages/data/message_model.dart';

import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:student_tawsel/features/messages/domain/messge_repository.dart';

class ListOfMessagesWidget extends StatefulWidget {
  final String chatId;
  final String currentUserId;

  const ListOfMessagesWidget({
    super.key,
    required this.chatId,
    required this.currentUserId,
  });

  @override
  State<ListOfMessagesWidget> createState() => _ListOfMessagesWidgetState();
}

class _ListOfMessagesWidgetState extends State<ListOfMessagesWidget> {
  final _messagesRepo = MessageRepository();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<MessageModel>>(
      stream: _messagesRepo.getMessages(widget.chatId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text('Error loading messages'));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final messages = snapshot.data ?? [];

        WidgetsBinding.instance.addPostFrameCallback((_) {
          _scrollToBottom();
        });

        return ListView.builder(
          controller: _scrollController,
          itemCount: messages.length,
          itemBuilder: (context, index) {
            final message = messages[index];
            var isSender =
                message.senderId == FirebaseAuthService().getCurrentUserid();
            return BubbleSpecialThree(
              textStyle: TextStyle(
                color: isSender ? Colors.black : Colors.white,
              ),
              text: message.content,
              color:
                  isSender ? const Color(0xFFE8E8EE) : AppPallete.primaryColor,
              tail: true,
              isSender: isSender,
            );
          },
        );
      },
    );
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }
}
