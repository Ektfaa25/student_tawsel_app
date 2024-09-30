import 'package:flutter/material.dart';
import 'package:student_tawsel/chapter_data.dart';
import 'package:student_tawsel/features/presentantion/pages/announcement_assignment_page.dart';

class ChapterDetailsCardsWidget extends StatelessWidget {
  final bool isannouncement;

  final bool isicon;
  const ChapterDetailsCardsWidget(
      {super.key, required this.isannouncement, required this.isicon});
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: isannouncement ? 2 : chapters.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(10),
                width: 355,
                height: isannouncement ? 117 : 62,
                child: Card(
                  elevation: 6,
                  color: const Color(0xffF6F6F6),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: ListTile(
                    onTap: () {
                      isannouncement
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AnnouncementAssignmentPage(
                                        subject: "",
                                        student: "",
                                      )))
                          : null;
                    },
                    title: isannouncement
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                chapters[index].assigmentt!,
                                style: const TextStyle(
                                    fontFamily: "Inter",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              Text(
                                chapters[index].chapterDescription,
                                style: const TextStyle(
                                    fontFamily: "Inter",
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ],
                          )
                        : Text(
                            chapters[index].chapterDescription,
                            style: const TextStyle(
                                fontFamily: "Inter",
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                    trailing:
                        isicon ? Image.asset("assets/iconfolder.png") : null,
                  ),
                ),
              );
            }));
  }
}
