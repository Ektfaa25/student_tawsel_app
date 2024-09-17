import 'package:flutter/material.dart';

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
      color: const Color(0xff182243),
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
          Text(
            name,
            style: const TextStyle(
              fontFamily: "Inter",
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            level,
            style: const TextStyle(
              fontFamily: "Inter",
              fontWeight: FontWeight.w700,
              fontSize: 11,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
