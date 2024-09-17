import 'package:flutter/material.dart';
import 'package:student_tawsel/popup_menu_data.dart';
import 'package:student_tawsel/presentantion/pages/home_page.dart';
import 'package:student_tawsel/presentantion/widgets/button_selection_widget.dart';
import 'package:student_tawsel/presentantion/widgets/chapter_details_cards_widget.dart';
import 'package:student_tawsel/presentantion/widgets/pop_up_menu_widget.dart';
import 'package:student_tawsel/student_class.dart';

class AnnouncementAssignmentPage extends StatelessWidget {
  final String subject;

  final String student;

  const AnnouncementAssignmentPage(
      {super.key, required this.subject, required this.student});

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
            centerTitle: true,
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
              ChapterDetailsCardsWidget(isannouncement: true, isicon: false),
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
