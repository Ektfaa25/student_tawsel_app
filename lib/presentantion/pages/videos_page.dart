import 'package:flutter/material.dart';

import 'package:student_tawsel/popup_menu_data.dart';
import 'package:student_tawsel/presentantion/widgets/avatar_widget.dart';
import 'package:student_tawsel/presentantion/widgets/button_selection_widget.dart';
import 'package:student_tawsel/presentantion/widgets/pop_up_menu_widget.dart';
import 'package:student_tawsel/presentantion/widgets/video_card_widget.dart';

class VideosPage extends StatelessWidget {
  final String student;

  final String subject;
  const VideosPage({super.key, required this.student, required this.subject});

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
      body: Column(
        children: [
          ButtonSelectionWidget(
            btnSelectone: "Files",
            btnSelecttwo: "Videos",
            isSelectedfirst: false,
            student: student,
            subject: subject,
          ),
          VideoCardWidget(student: student),
        ],
      ),
    );
  }
}
