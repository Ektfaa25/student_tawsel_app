import 'package:flutter/material.dart';
import 'package:student_tawsel/core/theme/app_pallete.dart';
import 'package:student_tawsel/features/add_child/data/child_model.dart';
import 'package:student_tawsel/features/add_child/domain/child_repo.dart';

class StudentCardWidget extends StatefulWidget {
  final String name;
  final String level;

  const StudentCardWidget({
    super.key,
    required this.name,
    required this.level,
  });

  @override
  State<StudentCardWidget> createState() => _StudentCardWidgetState();
}

class _StudentCardWidgetState extends State<StudentCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(21),
        ),
        color: AppPallete.primaryColor,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 65,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
              ),
              ClipOval(
                child: Container(
                  color: Colors.grey[300],
                  child: Image.asset("assets/smiling-face-of-a-child-2 1.png",
                      width: 58, height: 56, fit: BoxFit.contain),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(widget.name,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppPallete.secondaryColor,
                  )),
          const SizedBox(height: 10),
          Text(widget.level,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppPallete.secondaryColor,
                  )),
        ]));
  }
}
