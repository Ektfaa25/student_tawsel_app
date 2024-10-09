import 'package:flutter/material.dart';
import 'package:student_tawsel/features/add_child/data/child_model.dart';
import 'package:student_tawsel/features/add_child/domain/child_repo.dart';
import 'package:student_tawsel/features/presentantion/widgets/app_bar_back_ground_widget.dart';
import 'package:student_tawsel/features/presentantion/widgets/app_bar_user_content_wodget.dart';
import 'package:student_tawsel/features/presentantion/widgets/carousel_widget.dart';
import 'package:student_tawsel/features/presentantion/widgets/children__card_widget.dart';

import 'package:student_tawsel/generated/l10n.dart';
import 'package:student_tawsel/features/presentantion/pages/settings_page.dart';

// this page is for viewing all children
class ViewAllChildrenPage extends StatelessWidget {
  final Function(Locale) onLocaleChange;

  ViewAllChildrenPage({
    super.key,
    required this.onLocaleChange,
  });

  final ChildRepository _childRepository = ChildRepository();
  Future<List<ChildModel>> fetchchildren() async {
    return await _childRepository.getChildren();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: const AppBarBackGroundWidget(
          isloginparent: false,
        ),
        title: const AppBarUserContentWidget(),
        actions: [
          IconButton(
              padding: const EdgeInsets.all(19),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SettingsPage(
                    onLocaleChange: onLocaleChange,
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
            //this widget is  carousel that dispalys images
            const CarouselWidget(),
            Padding(
              padding: const EdgeInsets.only(
                  left: 17, right: 27, top: 24, bottom: 13),
              child: Text(S.of(context).myChildren,
                  style: TextStyle(
                      fontFamily:
                          Theme.of(context).textTheme.bodyLarge?.fontFamily,
                      fontWeight: FontWeight.w700,
                      fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                      color: Theme.of(context).textTheme.bodyLarge?.color)),
            ),
            FutureBuilder<List<ChildModel>>(
              future: fetchchildren(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return const Center(child: Text('Error fetching data'));
                }

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No data available'));
                }

                final children = snapshot.data!;

                //this widget is for the children cards
                return MyChildrenCardWidget(
                  children: children,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
