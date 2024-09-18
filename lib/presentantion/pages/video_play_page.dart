import 'package:flutter/material.dart';
import 'package:student_tawsel/popup_menu_data.dart';
import 'package:student_tawsel/presentantion/widgets/avatar_widget.dart';
import 'package:student_tawsel/presentantion/widgets/pop_up_menu_widget.dart';

class VideoPlayPage extends StatelessWidget {
  final String chapterImage;

  final String chapterdescription;

  final String student;

  const VideoPlayPage(
      {super.key,
      required this.chapterImage,
      required this.chapterdescription,
      required this.student});

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
        title: Row(
          children: [
            const AvatarWidget(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                student,
                style: const TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        actions: [
          PopUpMenuWidget(menuItems: menuItems(context), menuImgs: menuImgs),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 318,
              child: Image.asset(chapterImage, fit: BoxFit.cover),
            ),
            const SizedBox(
              height: 18,
            ),
            Container(
              margin: const EdgeInsets.all(10),
              width: 355,
              height: 101,
              child: Card(
                elevation: 6,
                color: const Color(0xffF6F6F6),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      chapterdescription,
                      style: const TextStyle(
                          fontFamily: "Inter",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    Container(
                      height: 79,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21),
                      ),
                      child: Image.asset(
                        chapterImage,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
