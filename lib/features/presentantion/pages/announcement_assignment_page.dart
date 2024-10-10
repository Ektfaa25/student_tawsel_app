import 'package:flutter/material.dart';
import 'package:student_tawsel/popup_menu_data.dart';
import 'package:student_tawsel/features/presentantion/widgets/app_bar_back_ground_widget.dart';
import 'package:student_tawsel/features/presentantion/widgets/avatar_widget.dart';
import 'package:student_tawsel/features/presentantion/widgets/chapter_details_cards_widget.dart';
import 'package:student_tawsel/features/presentantion/widgets/pop_up_menu_widget.dart';

class AnnouncementAssignmentPage extends StatelessWidget {
  final String subject;

  final String student;

  const AnnouncementAssignmentPage(
      {super.key, required this.subject, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            flexibleSpace: const AppBarBackGroundWidget(
              isloginparent: false,
            ),
            title: Row(
              children: [
                const AvatarWidget(),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  student,
                  style: const TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            actions: [
              PopUpMenuWidget(
                  menuItems: menuItems(context), menuImgs: menuImgs),
            ]),
        body: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              ChapterDetailsCardsWidget(
                  isannouncement: true, isicon: false),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xff182243),
          onPressed: () {},
          child: const Icon(Icons.add, color: Colors.white, size: 50),
        ));
  }
}
