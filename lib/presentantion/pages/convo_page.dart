import 'package:flutter/material.dart';
import 'package:student_tawsel/presentantion/widgets/chatbubble_widget.dart';
import 'package:student_tawsel/presentantion/pages/home_page.dart';

class ConversationPage extends StatelessWidget {
  final String name;
  final String profession;

  const ConversationPage({
    super.key,
    required this.name,
    required this.profession,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 139,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(22),
              bottomRight: Radius.circular(22),
            ),
          ),
          backgroundColor: const Color(0xff182243),
          elevation: 0,
          title: Row(children: [
            const AvatarWidget(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color(0xffFCFCFC),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    profession,
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
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "25 MAR",
              style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff474747)),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: const [
                      ChatBubbleWidget(
                        message: "Hello MR Adel",
                        isSentByMe: true,
                      ),
                      ChatBubbleWidget(
                        message: "Hello Sir",
                        isSentByMe: false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
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
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.attachment_rounded,
                        color: Colors.black,
                        size: 30,
                      ),
                      suffixIcon:
                          Icon(Icons.send, color: Colors.black, size: 30),
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
