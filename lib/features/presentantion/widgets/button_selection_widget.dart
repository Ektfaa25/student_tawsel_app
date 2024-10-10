import 'package:flutter/material.dart';

import 'package:student_tawsel/features/presentantion/pages/announcements_page.dart';
import 'package:student_tawsel/features/subjects/presentation/student_subject_chapter_details_page.dart';
import 'package:student_tawsel/features/subjects/presentation/student_subject_chapters_page.dart';
import 'package:student_tawsel/features/subjects/presentation/student_subject_page.dart';
import 'package:student_tawsel/features/presentantion/pages/tracking_page.dart';
import 'package:student_tawsel/features/presentantion/pages/videos_page.dart';

class ButtonSelectionWidget extends StatelessWidget {
  final String? studentname;

  final String? subject;
  final String btnSelectone;
  final String btnSelecttwo;
  final bool isSelectedfirst;

  const ButtonSelectionWidget({
    super.key,
    required this.btnSelectone,
    required this.btnSelecttwo,
    required this.isSelectedfirst,
    this.studentname,
    this.subject,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Container(
        width: 151,
        height: 56,
        margin: const EdgeInsets.all(15),
        child: TextButton(
            style: ButtonStyle(
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  side: BorderSide(
                      color: isSelectedfirst
                          ? Colors.transparent
                          : const Color(0xff182243)),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
              ),
              backgroundColor: isSelectedfirst
                  ? const WidgetStatePropertyAll(Color(0xff182243))
                  : const WidgetStatePropertyAll(Colors.white),
            ),
            onPressed: () {
              switch (btnSelectone) {
                case "Assigned":
                  break;
                case "Offline":
                  break;
                case "Chapters":
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StudentSubjectChaptersPage(
                                subject: subject!,
                                student: studentname!,
                              )));
                  break;
                case "Files":
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              StudentSubjectChapterDetailsPage(
                                pdfname: "",
                                pdfurl: null,
                                student: studentname!,
                              )));
                  break;

                case "Subjects":
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StudentSubjectPage(
                                name: studentname,
                                //level: subject!,
                              )));
                  break;

                default:
              }
            },
            child: Text(btnSelectone,
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color:
                      isSelectedfirst ? Colors.white : const Color(0xff3F3D3D),
                ))),
      ),
      SizedBox(
        width: 160,
        height: 56,
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: isSelectedfirst
                ? const WidgetStatePropertyAll(Colors.white)
                : const WidgetStatePropertyAll(Color(0xff182243)),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                side: BorderSide(
                  width: 1.5,
                  color: isSelectedfirst
                      ? const Color(0xff182243)
                      : Colors.transparent,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
          onPressed: () {
            switch (btnSelecttwo) {
              case "Submitted":
                break;
              case "Online":
                break;
              case "Announcements":
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AnnouncementsPage(
                              subject: subject!,
                              student: studentname!,
                            )));
                break;
              case "Videos":
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VideosPage(
                              student: studentname!,
                            )));
                break;

              case "Tracking":
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TrackingPage(
                              student: studentname!,
                            )));
                break;

              default:
            }
          },
          child: Text(
            btnSelecttwo,
            style: TextStyle(
              fontFamily: "Inter",
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isSelectedfirst ? const Color(0xff3F3D3D) : Colors.white,
            ),
          ),
        ),
      ),
    ]);
  }
}
