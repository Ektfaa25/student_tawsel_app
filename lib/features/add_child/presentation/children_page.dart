import 'package:flutter/material.dart';
import 'package:student_tawsel/features/add_child/data/child_model.dart';
import 'package:student_tawsel/features/add_child/domain/child_repo.dart';
import 'package:student_tawsel/generated/l10n.dart';

import 'package:student_tawsel/features/presentantion/widgets/app_bar_back_ground_widget.dart';

import 'package:student_tawsel/features/presentantion/widgets/avatar_widget.dart';

class ChildrenPage extends StatefulWidget {
  const ChildrenPage({super.key});

  @override
  ChildrenPageState createState() => ChildrenPageState();
}

class ChildrenPageState extends State<ChildrenPage> {
  final ChildRepository _childRepository = ChildRepository();

  Future<List<ChildModel>>? childrenFuture;

  @override
  void initState() {
    super.initState();
    // Fetch the children when the widget is initialized
    childrenFuture = _childRepository.getChildren();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // flexibleSpace: const AppBarBackGroundWidget(),
        automaticallyImplyLeading: false,
        title: Text(
          S.of(context).children,
        ),
      ),
      body: FutureBuilder<List<ChildModel>>(
        future: _childRepository.getChildren(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator()); // Loading spinner
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No children found.'));
          } else {
            // The data is available and we can build the list
            final children = snapshot.data!;
            return ListView.builder(
              itemCount: children.length,
              itemBuilder: (context, index) {
                final child = children[index];
                return Card(
                  color: const Color(0xffF6F6F6),
                  margin: const EdgeInsets.only(
                    left: 20,
                    right: 19,
                    top: 20,
                  ),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 15, right: 20, top: 14, bottom: 17),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const AvatarWidget(),
                            Text(
                              "  Level : ${child.level}",
                              style: const TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff2D2D2D)),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '${child.name}',
                              style: const TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff2D2D2D)),
                            ),
                            const SizedBox(height: 47),
                            Text(
                              " ID : ${child.id}",
                              style: const TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff2D2D2D)),
                            ),
                          ],
                        ),
                      ],
                    ),
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
