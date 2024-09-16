import 'package:flutter/material.dart';

class ChatBubbleWidget extends StatelessWidget {
  final String message;
  final bool isSentByMe;

  const ChatBubbleWidget({
    super.key,
    required this.message,
    required this.isSentByMe,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          color: isSentByMe ? Colors.grey[200] : const Color(0xff182243),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20),
            topRight: const Radius.circular(20),
            bottomLeft: isSentByMe
                ? const Radius.circular(20)
                : const Radius.circular(0),
            bottomRight: isSentByMe
                ? const Radius.circular(0)
                : const Radius.circular(20),
          ),
        ),
        child: Text(
          message,
          style: TextStyle(
              fontSize: 16, color: isSentByMe ? Colors.black : Colors.white),
        ),
      ),
    );
  }
}
