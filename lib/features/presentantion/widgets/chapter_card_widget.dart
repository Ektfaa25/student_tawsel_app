import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:student_tawsel/chapter_data.dart';
import 'package:student_tawsel/features/subjects/data/pdf_model.dart';
import 'package:student_tawsel/features/subjects/domain/pdf_rep.dart';
import 'package:student_tawsel/features/subjects/presentation/student_subject_chapter_details_page.dart';
import 'package:student_tawsel/generated/l10n.dart';

class ChapterCardWidget extends StatelessWidget {
  final List<PDFModel> pdfs;
  final String student;
  ChapterCardWidget({
    super.key,
    required this.pdfs,
    required this.student,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(17),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: pdfs.length,
      itemBuilder: (context, index) {
        final pdf = pdfs[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StudentSubjectChapterDetailsPage(
                  student: student,
                  pdfurl: pdfs[index].downloadURL,
                  pdfname: pdfs[index].fileName,
                ),
              ),
            );
          },
          child: SizedBox(
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
                              pdf.fileName,
                              style: const TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            Text(
                              pdf.fileDescription,
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
          ),
        );
      },
    );
  }
}
