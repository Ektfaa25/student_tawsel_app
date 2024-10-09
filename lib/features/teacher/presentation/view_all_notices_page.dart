import 'package:flutter/material.dart';

import 'package:student_tawsel/features/chat/presentation/chat_page.dart';
import 'package:student_tawsel/features/presentantion/pages/settings_page.dart';
import 'package:student_tawsel/features/presentantion/widgets/app_bar_back_ground_widget.dart';
import 'package:student_tawsel/features/presentantion/widgets/app_bar_user_content_wodget.dart';
import 'package:student_tawsel/features/presentantion/widgets/carousel_widget.dart';
import 'package:student_tawsel/features/presentantion/widgets/latest_notice_widget.dart';
import 'package:student_tawsel/features/presentantion/widgets/latest_notices_card_content_widget.dart';
import 'package:student_tawsel/features/teacher/data/teacher_model.dart';
import 'package:student_tawsel/features/teacher/domain/teacher_repository.dart';
import 'package:student_tawsel/generated/l10n.dart';

// this page is for viewing all notices
class ViewAllNoticesPage extends StatefulWidget {
  final Function(Locale) onLocaleChange;
  const ViewAllNoticesPage({
    super.key,
    required this.onLocaleChange,
  });

  @override
  State<ViewAllNoticesPage> createState() => _ViewAllNoticesPageState();
}

class _ViewAllNoticesPageState extends State<ViewAllNoticesPage> {
  final TeacherRepository _teacherRepository = TeacherRepository();

  Future<List<TeacherModel>> fetchTeachers() async {
    return await _teacherRepository.getAllTeachers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          // flexibleSpace: const AppBarBackGroundWidget(),
          title: const AppBarUserContentWidget(),
          actions: [
            IconButton(
                padding: const EdgeInsets.all(19),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SettingsPage(
                      onLocaleChange: widget.onLocaleChange,
                    );
                  }));
                },
                icon: Image.asset("assets/icon _settings_.png")),
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
                child: Text(S.of(context).latestNotices,
                    style: TextStyle(
                        fontFamily:
                            Theme.of(context).textTheme.bodyLarge?.fontFamily,
                        fontWeight: FontWeight.w700,
                        fontSize:
                            Theme.of(context).textTheme.bodyLarge?.fontSize,
                        color: Theme.of(context).textTheme.bodyLarge?.color)),
              ),
              LatestNoticesCardContentWidget()
            ],
          ),
        ));
  }
}
