import 'package:flutter/material.dart';

import 'package:student_tawsel/carousel_widget.dart';
import 'package:student_tawsel/generated/l10n.dart';

import 'package:student_tawsel/latest_notice_widget.dart';
import 'package:student_tawsel/children/children__card_widget.dart';
import 'package:student_tawsel/settings_page.dart';

import 'package:student_tawsel/view_all_notices_page.dart';
import 'package:student_tawsel/children/view_all_children_page.dart';

class HomePage extends StatefulWidget {
  final Function(Locale) onLocaleChange;

  const HomePage({super.key, required this.onLocaleChange});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 139,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(22),
            bottomRight: Radius.circular(22),
          ),
        ),
        backgroundColor: const Color(0xff182243),
        elevation: 0,
        title: const AppBarUserContent(),
        actions: [
          IconButton(
              padding: const EdgeInsets.all(19),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SettingsPage(
                    onLocaleChange: widget.onLocaleChange,
                  );
                }));
              },
              icon: Image.asset("assets/icon _settings_.png")),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CarouselWidget(),
            MyChildrenLine(
              onLocaleChange: widget.onLocaleChange,
            ),
            const MyChildrenCardWidget(
              itemssize: 2,
            ),
            const LatestNoticesLine(),
            const LatestNoticesCard(itemssize: 2),
          ],
        ),
      ),

      //Floating Chat Button
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff182243),
        onPressed: () {},
        child: Image.asset("assets/icon _chat_lines_.png",
            width: 32, height: 35, fit: BoxFit.cover),
      ),
    );
  }
}

class AppBarUserContent extends StatefulWidget {
  const AppBarUserContent({
    super.key,
  });

  @override
  State<AppBarUserContent> createState() => _AppBarUserContentState();
}

class _AppBarUserContentState extends State<AppBarUserContent> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const AvatarWidget(),
        const SizedBox(width: 13),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).profileName,
              style: const TextStyle(
                fontFamily: "Inter",
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            Text(
              S.of(context).profileEmail,
              style: const TextStyle(
                fontFamily: "Inter",
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
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
            child: Image.asset("assets/smiling-face-of-a-child-2 1.png",
                width: 75, height: 77, fit: BoxFit.contain),
          ),
        ),
      ],
    );
  }
}

class MyChildrenLine extends StatelessWidget {
  final Function(Locale) onLocaleChange;
  const MyChildrenLine({
    super.key,
    required this.onLocaleChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 17,
        right: 27,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(S.of(context).myChildren,
              style: const TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Colors.black)),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: const Color(0xff2F2E2E),
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ViewAllChildren(
                  onLocaleChange: onLocaleChange,
                );
              }));
            },
            child: Text(S.of(context).viewAll,
                style: const TextStyle(
                  fontFamily: "Inter",
                  decoration: TextDecoration.underline,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                )),
          )
        ],
      ),
    );
  }
}

class LatestNoticesLine extends StatelessWidget {
  const LatestNoticesLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 17,
        right: 27,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(S.of(context).latestNotices,
              style: const TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Colors.black)),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: const Color(0xff2F2E2E),
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ViewAllNotices();
              }));
            },
            child: Text(S.of(context).viewAll,
                style: const TextStyle(
                  fontFamily: "Inter",
                  decoration: TextDecoration.underline,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                )),
          )
        ],
      ),
    );
  }
}
