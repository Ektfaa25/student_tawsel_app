import 'package:flutter/material.dart';
import 'package:student_tawsel/generated/l10n.dart';

import 'package:student_tawsel/presentantion/widgets/app_bar_back_ground_widget.dart';
import 'package:student_tawsel/child_data.dart';
import 'package:student_tawsel/presentantion/widgets/avatar_widget.dart';

class ChildrenPage extends StatelessWidget {
  const ChildrenPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 139,
        flexibleSpace: const AppBarBackGroundWidget(),
        backgroundColor: const Color(0xff182243),
        automaticallyImplyLeading: false,
        title: Text(S.of(context).children,
            style: const TextStyle(
              fontFamily: "Inter",
              fontWeight: FontWeight.bold,
              fontSize: 32,
              color: Colors.white,
            )),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(22),
            bottomRight: Radius.circular(22),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: childrendata.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Card(
                      color: const Color(0xffF6F6F6),
                      margin: const EdgeInsets.only(
                        left: 20,
                        right: 19,
                        top: 20,
                      ),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 15, right: 12, top: 14, bottom: 17),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Column(
                                children: [
                                  const AvatarWidget(),
                                  Text(
                                    "  Level : ${childrendata[index].level}",
                                    style: const TextStyle(
                                        fontFamily: "Inter",
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff2D2D2D)),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  childrendata[index].name,
                                  style: const TextStyle(
                                      fontFamily: "Inter",
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff2D2D2D)),
                                ),
                                const SizedBox(height: 47),
                                Text(
                                  " ID : ${childrendata[index].id}",
                                  style: const TextStyle(
                                      fontFamily: "Inter",
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff2D2D2D)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
