import 'package:flutter/material.dart';
import 'package:student_tawsel/chapter_data.dart';
import 'package:student_tawsel/features/presentantion/pages/student_subject_chapter_details_page.dart';

class ChapterCardWidget extends StatelessWidget {
  final String student;

  final String subject;

  const ChapterCardWidget(
      {super.key, required this.subject, required this.student});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StudentSubjectChapterDetailsPage(
              subject: subject,
              student: student,
            ),
          ),
        );
      },
      child: ListView.builder(
        padding: const EdgeInsets.all(17),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: chapters.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 117,
            child: Card(
                elevation: 4,
                margin: const EdgeInsets.all(2),
                color: const Color(0xffF6F6F6),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(17.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Chapter Name",
                            style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                          ),
                          Text(
                            "Chapter Description",
                            style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Color(0xff474747)),
                          ),
                        ],
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              chapters[index].chapterName,
                              style: const TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            Text(
                              chapters[index].chapterDescription,
                              style: const TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )
                          ]),
                    ],
                  ),
                )),
          );
        },
      ),
    );
  }
}
