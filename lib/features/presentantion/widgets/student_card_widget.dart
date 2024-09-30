import 'package:flutter/material.dart';
import 'package:student_tawsel/core/theme/app_pallete.dart';

class StudentCardWidget extends StatelessWidget {
  final String name;
  final String level;
  final String imagePath;

  const StudentCardWidget({
    super.key,
    required this.name,
    required this.level,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(21),
      ),
      color: AppPallete.primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
                  child: Image.asset(imagePath,
                      width: 58, height: 56, fit: BoxFit.contain),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(name,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppPallete.secondaryColor,
                  )),
          const SizedBox(height: 10),
          Text(level,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppPallete.secondaryColor,
                  )),
        ],
      ),
    );
  }
}
