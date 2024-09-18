import 'package:flutter/material.dart';
import 'package:student_tawsel/presentantion/pages/chat_page.dart';
import 'package:student_tawsel/presentantion/pages/settings_page.dart';
import 'package:student_tawsel/presentantion/widgets/app_bar_user_content_wodget.dart';
import 'package:student_tawsel/presentantion/widgets/carousel_widget.dart';

import 'package:student_tawsel/generated/l10n.dart';
import 'package:student_tawsel/presentantion/widgets/latest_notice_widget.dart';

// this page is for viewing all notices
class ViewAllNoticesPage extends StatelessWidget {
  final Function(Locale) onLocaleChange;
  const ViewAllNoticesPage({super.key, required this.onLocaleChange});

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
        title: const AppBarUserContentWidget(),
        actions: [
          IconButton(
              padding: const EdgeInsets.all(19),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SettingsPage(
                    onLocaleChange: onLocaleChange,
                  );
                }));
              },
              icon: Image.asset("assets/icon _settings_.png")),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //this widget is for the carousel that dispalys images
            const CarouselWidget(),
            Padding(
              padding: const EdgeInsets.only(
                  left: 17, right: 27, top: 24, bottom: 13),
              child: Text(S.of(context).latestNotices,
                  style: const TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.black)),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ChatPage()),
                  );
                },
                //this widget is for the latest notices list
                child: const LatestNoticesCardWidget()),
          ],
        ),
      ),
    );
  }
}
