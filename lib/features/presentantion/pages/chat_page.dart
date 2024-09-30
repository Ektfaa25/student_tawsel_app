import 'package:flutter/material.dart';

import 'package:student_tawsel/features/presentantion/pages/convo_page.dart';
import 'package:student_tawsel/generated/l10n.dart';
import 'package:student_tawsel/features/presentantion/widgets/app_bar_back_ground_widget.dart';
import 'package:student_tawsel/tacher_class.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        flexibleSpace: const AppBarBackGroundWidget(),
        title: Text(
          S.of(context).chat,
        ),
      ),
      body: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Card(
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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ConversationPage(
                              name: teacherData[index].name,
                              profession: teacherData[index].profession,
                            ),
                          ));
                    },
                    child: Column(
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
                          teacherData[index].name,
                          style: const TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black,
                          ),
                          // style: Theme.of(context)
                          //     .textTheme
                          //     .bodyMedium
                          //     ?.copyWith(
                          //       fontWeight: FontWeight.w500,
                          //     )
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          teacherData[index].profession,
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
                          // style:
                          //     Theme.of(context).textTheme.bodyMedium?.copyWith(
                          //           fontWeight: FontWeight.w500,
                          //         )
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
