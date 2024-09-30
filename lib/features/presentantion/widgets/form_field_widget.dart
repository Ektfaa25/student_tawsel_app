import 'package:flutter/material.dart';

class FormFieldWidget extends StatelessWidget {
  //   final child = ChildModel(
  //   id: '123',
  //   name: 'Mohamed',
  //   gender: 'Male',
  //   level: 'First',
  //   dateOfBirth: DateTime(2010, 5, 12),
  //   phone: '+996',
  // );
  // controller.text = value;
  final TextEditingController controller;
  final String label;
  const FormFieldWidget({
    super.key,
    required this.controller,
    required this.label,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      margin: const EdgeInsets.all(8),
      color: Colors.white,
      child: TextFormField(
        style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            fontFamily: "Tajawal",
            color: Color(0xff2D2D2D)),
        controller: controller,
        decoration: InputDecoration(
            labelStyle: const TextStyle(
                fontSize: 12, fontFamily: "Tajawal", color: Color(0xff9B9B9B)),
            labelText: label,
            suffixIcon: label == "Phone"
                ? null
                : const Icon(Icons.check, color: Colors.green),
            border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ))),
      ),
    );
  }
}
