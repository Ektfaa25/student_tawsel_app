import 'package:flutter/material.dart';
import 'package:student_tawsel/carousel_widget.dart';
import 'package:student_tawsel/children/children__card_widget.dart';

import 'package:student_tawsel/generated/l10n.dart';
import 'package:student_tawsel/homepage/home_page.dart';

class ViewAllChildren extends StatelessWidget {
  const ViewAllChildren({super.key});

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
        title: const AppBarUserContent(),
        actions: [
          Padding(
            padding: const EdgeInsets.all(19),
            child: Image.asset("assets/icon _settings_.png"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CarouselWidget(),
            Padding(
              padding: const EdgeInsets.only(
                  left: 17, right: 27, top: 24, bottom: 13),
              child: Text(S.of(context).myChildren,
                  style: const TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.black)),
            ),
            GestureDetector(child: const MyChildrenCardWidget()),
          ],
        ),
      ),
    );
  }
}
