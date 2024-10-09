import 'package:flutter/material.dart';
import 'package:student_tawsel/features/add_child/data/child_model.dart';
import 'package:student_tawsel/features/add_child/domain/child_repo.dart';

import 'package:student_tawsel/features/subjects/presentation/student_subject_page.dart';
import 'package:student_tawsel/features/presentantion/widgets/student_card_widget.dart';

class MyChildrenCardWidget extends StatefulWidget {
  final int? itemssize;

  MyChildrenCardWidget({
    super.key,
    this.itemssize, required List<ChildModel> children,
  });

  @override
  State<MyChildrenCardWidget> createState() => _MyChildrenCardWidgetState();
}

class _MyChildrenCardWidgetState extends State<MyChildrenCardWidget> {
  final ChildRepository _childRepository = ChildRepository();

  late Future<List<ChildModel>> fetchchildren;

  @override
  void initState() {
    super.initState();

    fetchchildren = _childRepository.getChildren();
  }

  int _getCardCount({required List<ChildModel> children}) {
    if (widget.itemssize != null) {
      return widget.itemssize!;
    } else {
      return children.length;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ChildModel>>(
        future: fetchchildren,
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

            return GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(left: 17, right: 27),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 25,
                ),
                itemCount: _getCardCount(children: children),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final student = children[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StudentSubjectPage(
                            name: student.name,
                            level: student.level,
                            id: student.id,
                          ),
                        ),
                      );
                    },
                    child: StudentCardWidget(
                      name: student.name,
                      level: student.level,
                    ),
                  );
                });
          }
        });
  }
}
