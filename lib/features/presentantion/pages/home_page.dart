import 'package:flutter/material.dart';
import 'package:student_tawsel/core/theme/app_pallete.dart';
import 'package:student_tawsel/features/presentantion/widgets/app_bar_back_ground_widget.dart';
import 'package:student_tawsel/features/presentantion/widgets/app_bar_user_content_wodget.dart';
import 'package:student_tawsel/features/presentantion/widgets/carousel_widget.dart';
import 'package:student_tawsel/generated/l10n.dart';
import 'package:student_tawsel/features/presentantion/widgets/latest_notice_widget.dart';
import 'package:student_tawsel/features/presentantion/widgets/children__card_widget.dart';
import 'package:student_tawsel/features/presentantion/pages/settings_page.dart';
import 'package:student_tawsel/features/presentantion/pages/view_all_notices_page.dart';
import 'package:student_tawsel/features/presentantion/pages/view_all_children_page.dart';

class HomePage extends StatefulWidget {
  final Function(Locale) onLocaleChange;

  const HomePage({super.key, required this.onLocaleChange});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          children: [
            //this widget is for the carousel that dispalys images
            const CarouselWidget(),
            MyChildrenLine(
              onLocaleChange: widget.onLocaleChange,
            ),
            //this widget is for the children cards
            const MyChildrenCardWidget(
              itemssize: 2,
            ),
            LatestNoticesLine(
              onLocaleChange: widget.onLocaleChange,
            ),
            //this widget is for the latest notices list
            const LatestNoticesCardWidget(itemssize: 2),
          ],
        ),
      ),

      //Floating Chat Button
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppPallete.primaryColor,
        onPressed: () {},
        child: Image.asset("assets/icon _chat_lines_.png",
            width: 32, height: 35, fit: BoxFit.cover),
      ),
    );
  }
}

class MyChildrenLine extends StatelessWidget {
  final Function(Locale) onLocaleChange;
  const MyChildrenLine({
    super.key,
    required this.onLocaleChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 17,
        right: 27,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(S.of(context).myChildren,
              style: TextStyle(
                  fontFamily: Theme.of(context).textTheme.bodyLarge?.fontFamily,
                  fontWeight: FontWeight.w700,
                  fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                  color: Theme.of(context).textTheme.bodyLarge?.color)),
          TextButton(
            style: TextButton.styleFrom(),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ViewAllChildrenPage(
                  onLocaleChange: onLocaleChange,
                );
              }));
            },
            child: Text(S.of(context).viewAll,
                style: TextStyle(
                  fontFamily:
                      Theme.of(context).textTheme.labelMedium?.fontFamily,
                  decoration: TextDecoration.underline,
                  fontSize: Theme.of(context).textTheme.labelMedium?.fontSize,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).textTheme.labelMedium?.color,
                )),
          )
        ],
      ),
    );
  }
}

class LatestNoticesLine extends StatelessWidget {
  final Function(Locale) onLocaleChange;
  const LatestNoticesLine({
    super.key,
    required this.onLocaleChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 17,
        right: 27,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(S.of(context).latestNotices,
              style: TextStyle(
                  fontFamily: Theme.of(context).textTheme.bodyLarge?.fontFamily,
                  fontWeight: FontWeight.w700,
                  fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                  color: Theme.of(context).textTheme.bodyLarge?.color)),
          TextButton(
            style: TextButton.styleFrom(),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ViewAllNoticesPage(
                  onLocaleChange: onLocaleChange,
                );
              }));
            },
            child: Text(S.of(context).viewAll,
                style: TextStyle(
                  fontFamily:
                      Theme.of(context).textTheme.labelMedium?.fontFamily,
                  decoration: TextDecoration.underline,
                  fontSize: Theme.of(context).textTheme.labelMedium?.fontSize,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).textTheme.labelMedium?.color,
                )),
          )
        ],
      ),
    );
  }
}
