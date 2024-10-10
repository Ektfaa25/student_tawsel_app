import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:student_tawsel/chapter_data.dart';
import 'package:student_tawsel/features/presentantion/pages/announcement_assignment_page.dart';

import 'package:student_tawsel/features/presentantion/widgets/chapter_card_widget.dart';
import 'package:student_tawsel/features/subjects/data/pdf_model.dart';
import 'package:student_tawsel/features/subjects/presentation/p_d_f_view_page.dart';

class ChapterDetailsCardsWidget extends StatelessWidget {
  final bool isannouncement;
  final List<PDFModel>? pdfs;
  final bool isicon;
  const ChapterDetailsCardsWidget({
    super.key,
    required this.isannouncement,
    required this.isicon,
    this.pdfs,
  });
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
                        : GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PDFViewPage(
                                        pdfUrl: pdfs![index].downloadURL)),
                              );
                            },
                            child: Text(
                              chapters[index].chapterDescription,
                              style: const TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ),
                    trailing:
                        isicon ? Image.asset("assets/iconfolder.png") : null,
                  ),
                ),
              );
            }));
  }
}
