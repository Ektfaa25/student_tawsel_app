import 'package:flutter/material.dart';
import 'package:student_tawsel/chapter_data.dart';
import 'package:student_tawsel/presentantion/pages/video_play_page.dart';

class VideoCardWidget extends StatelessWidget {
  final String student;

  const VideoCardWidget({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(10),
                width: 355,
                height: 101,
                child: Card(
                  elevation: 6,
                  color: const Color(0xffF6F6F6),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        chapters[index].chapterDescription,
                        style: const TextStyle(
                            fontFamily: "Inter",
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VideoPlayPage(
                                      student: student,
                                      chapterImage:
                                          chapters[index].chapterImage,
                                      chapterdescription:
                                          chapters[index].chapterDescription)));
                        },
                        child: Container(
                          height: 79,
                          width: 148,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(21),
                          ),
                          child: Image.asset(
                            chapters[index].chapterImage,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
