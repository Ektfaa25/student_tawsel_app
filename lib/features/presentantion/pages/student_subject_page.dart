import 'package:flutter/material.dart';
import 'package:student_tawsel/features/auth/data/subject_model.dart';
import 'package:student_tawsel/features/auth/domain/repository/subject_repo.dart';
import 'package:student_tawsel/features/presentantion/widgets/app_bar_back_ground_widget.dart';
import 'package:student_tawsel/features/presentantion/widgets/app_bar_user_content_wodget.dart';

import 'package:student_tawsel/features/presentantion/widgets/pop_up_menu_widget.dart';
import 'package:student_tawsel/popup_menu_data.dart';

class StudentSubjectPage extends StatelessWidget {
  const StudentSubjectPage({
    super.key,
    required this.student,
    required this.subject,
  });
  final String student;
  final String subject;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: const AppBarBackGroundWidget(),
        title: Row(
          children: [
            const AppBarUserContentWidget(),
            Text(
              student,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(),
            ),
          ],
        ),
        actions: [
          PopUpMenuWidget(menuItems: menuItems(context), menuImgs: menuImgs),
        ],
      ),
      body: FutureBuilder<List<SubjectModel>>(
        future: SubjectRepository().getSubjects(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No subjects available.'));
          } else {
            final subjects = snapshot.data!;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
              ),
              itemCount: subjects.length,
              itemBuilder: (context, index) {
                final subject = subjects[index];
                return GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => StudentSubjectChaptersPage(
                    //               subject: subjects[index],
                    //               student: student,
                    //             )));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(19)),
                        ),
                        child: Image.network(subject.subjectImg,
                            height: 80, width: 80),
                      ),
                      const SizedBox(height: 10),
                      Text(subject.subjectName,
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith()),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
