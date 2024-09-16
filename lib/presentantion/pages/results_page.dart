import 'package:flutter/material.dart';
import 'package:student_tawsel/presentantion/widgets/exam_list_widget.dart';

import 'package:student_tawsel/generated/l10n.dart';

import 'package:student_tawsel/exam_class.dart';

class ResultsPage extends StatefulWidget {
  const ResultsPage({
    super.key,
  });

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int nextPage = _pageController.page!.round();
      if (_currentPage != nextPage) {
        setState(() {
          _currentPage = nextPage;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Exam> passExams = filterExams(exams, 'Pass');
    List<Exam> failExams = filterExams(exams, 'Fail');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(22),
            bottomRight: Radius.circular(22),
          ),
        ),
        toolbarHeight: 139,
        automaticallyImplyLeading: false,
        title: Text(
          S.of(context).results,
          style: const TextStyle(
            fontFamily: "Inter",
            fontWeight: FontWeight.bold,
            fontSize: 32,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff182243),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: [
                ExamListWidget(
                  exams: passExams,
                ),
                ExamListWidget(
                  exams: failExams,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black,
                  )),
              child: Container(
                width: 272,
                height: 96,
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black,
                    )),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: _currentPage == 0
                          ? const Color(0xff2AF62A)
                          : Colors.red 
                      ),
                  onPressed: () {
                    if (_currentPage < 1) {
                      _pageController.animateToPage(
                        _currentPage + 1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Text(
                      _currentPage == 0
                          ? S.of(context).btnpass
                          : S.of(context).btnfail,
                      style: const TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: Colors.white,
                      )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExamCardWidget extends StatelessWidget {
  final Exam exam;
  const ExamCardWidget({
    super.key,
    required this.exam,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 153,
      child: Card(
          elevation: 4,
          color: const Color(0xffF6F6F6),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Exam Name',
                      style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      exam.examName,
                      style: const TextStyle(
                          fontFamily: "Inter",
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      exam.grade,
                      style: const TextStyle(
                          fontFamily: "Inter",
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      exam.examDate,
                      style: const TextStyle(
                          fontFamily: "Inter",
                          fontSize: 16,
                          color: Color(0xff474747),
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      exam.status,
                      style: const TextStyle(
                          fontFamily: "Inter",
                          fontSize: 16,
                          color: Color(0xff474747),
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      exam.percentage,
                      style: const TextStyle(
                          fontFamily: "Inter",
                          fontSize: 16,
                          color: Color(0xff474747),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
