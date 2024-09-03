import 'package:flutter/material.dart';
import 'package:student_tawsel/carousel_widget.dart';
import 'package:student_tawsel/latest_notice_widget.dart';
import 'package:student_tawsel/children__card_widget.dart';
import 'package:student_tawsel/viewall_children_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
          Padding(
            padding: const EdgeInsets.all(19),
            child: Image.asset("assets/icon _settings_.png"),
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            CarouselWidget(),
            MyChildrenLine(),
            MyChildrenCardWidget(itemssize: 2),
            LatestNoticesLine(),
            LatestNoticesCard(),
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

class AppBarUserContent extends StatelessWidget {
  const AppBarUserContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
                child: Image.asset("assets/smiling-face-of-a-child-2 1.png",
                    width: 75, height: 77, fit: BoxFit.contain),
              ),
            ),
          ],
        ),
        const SizedBox(width: 13),
        const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mohamed',
              style: TextStyle(
                fontFamily: "Inter",
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            Text(
              'mohamed@gmail.com',
              style: TextStyle(
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

class MyChildrenLine extends StatelessWidget {
  const MyChildrenLine({
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
          const Text("My Children",
              style: TextStyle(
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
                return const ViewAllChildren();
              }));
            },
            child: const Text("View all",
                style: TextStyle(
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
          const Text("Latest Notices",
              style: TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Colors.black)),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: const Color(0xff2F2E2E),
            ),
            onPressed: () {},
            child: const Text("View all",
                style: TextStyle(
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
