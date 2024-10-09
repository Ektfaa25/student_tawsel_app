// ignore_for_file: unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:student_tawsel/features/add_child/data/child_model.dart';
import 'package:student_tawsel/features/add_child/domain/child_repo.dart';
import 'package:student_tawsel/features/add_child/presentation/children_page.dart';
import 'package:student_tawsel/features/auth/firebase_auth.dart';
import 'package:student_tawsel/features/presentantion/widgets/button_widget.dart';
import 'package:student_tawsel/features/presentantion/widgets/app_bar_back_ground_widget.dart';
import 'package:student_tawsel/features/presentantion/widgets/avatar_widget.dart';
import 'package:student_tawsel/features/presentantion/widgets/drop_field_widget.dart';
import 'package:student_tawsel/features/presentantion/widgets/form_field_widget.dart';

import 'package:student_tawsel/generated/l10n.dart';

class AddChildPage extends StatefulWidget {
  final user = FirebaseAuthService().getCurrentUserid().toString();
  AddChildPage({
    super.key,
  });

  @override
  State<AddChildPage> createState() => _AddChildPageState();
}

class _AddChildPageState extends State<AddChildPage> {
  final TextEditingController childnameController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  String? selectedGender = 'Male';
  String? selectedLevel = 'First';
  String? selectedDay;
  String? selectedMonth;
  String? selectedYear;
// final child = ChildModel(
//     id: idController.text,
//     name: childnameController.text,
//     gender: selectedGender,
//     level: selectedLevel,,
//     dateOfBirth: DateTime(2010, 5, 12),
//     phone: phoneController.text,

//   );
  @override
  Widget build(BuildContext context) {
    // Creates a DateTime from text fields for the date of birth

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          S.of(context).child,
        ),
        centerTitle: true,
        // flexibleSpace: const AppBarBackGroundWidget(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            const Center(child: AvatarWidget()),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FormFieldWidget(
                  controller: childnameController,
                  label: "Name",
                ),
                FormFieldWidget(
                  controller: idController,
                  label: "id",
                ),
                DropFieldWidget(
                  label: 'Gender',
                  hint: "male",
                  formvalue: selectedGender,
                  items: const ['Male', 'Female'],
                  onChanged: (value) => setState(() => selectedGender = value),
                ),
                const SizedBox(
                  height: 10,
                ),
                DropFieldWidget(
                  label: 'Level',
                  hint: "first",
                  formvalue: selectedLevel,
                  items: const ['First', 'Second', 'Third'],
                  onChanged: (value) => setState(() => selectedLevel = value),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Date of Birthday',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    DropFieldWidget(
                      hint: 'MM',
                      formvalue: selectedMonth,
                      items: List.generate(12, (index) => '${index + 1}'),
                      onChanged: (value) =>
                          setState(() => selectedMonth = value),
                    ),
                    DropFieldWidget(
                      formvalue: selectedDay,
                      hint: 'DD',
                      items: List.generate(31, (index) => '${index + 1}'),
                      onChanged: (value) => setState(() => selectedDay = value),
                    ),
                    DropFieldWidget(
                      formvalue: selectedYear,
                      hint: 'YYYY',
                      items: List.generate(
                          50, (index) => '${DateTime.now().year - index}'),
                      onChanged: (value) =>
                          setState(() => selectedYear = value),
                    ),
                  ],
                ),
                FormFieldWidget(
                  controller: phoneController,
                  label: "Phone",
                ),
              ],
            )),

            //add button
            ButtonWidget(
              controller: childnameController,
              label: "Add",
              onPressed: () {
                addChildToParent(widget.user);

                childnameController.clear();
                idController.clear();
                phoneController.clear();
              },
            ),
          ],
        ),
      ),
    );
  }

  void addChildToParent(String parentUid) async {
    try {
      // Step 1: Get the Child ID from the form
      String childId = idController.text; // Use the Child ID from the form

      if (childId.isEmpty) {
        print('Child ID is required.');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Child ID cannot be empty.')),
        );
        return;
      }

      // Step 2: Create the ChildModel using the form-provided childId
      final child = ChildModel(
        id: childId, // Use the ID from the form
        name: childnameController.text,
        gender: selectedGender!,
        level: selectedLevel!,
        dateOfBirth: DateTime(int.parse(selectedYear!),
            int.parse(selectedMonth!), int.parse(selectedDay!)),
        phone: phoneController.text,
      );

      // Step 3: Save the child's details in the 'children' collection using the form-provided ID
      await FirebaseFirestore.instance.collection('children').doc(childId).set({
        'childId': childId, // Use the ID from the form
        'parentId': parentUid, // Parent's UID for linking
        'name': child.name,
        'gender': child.gender,
        'level': child.level,
        'dateOfBirth': child.dateOfBirth.toIso8601String(),
        'phone': child.phone,
      });

      // Step 4: Add the child to the parent's 'children' array in the 'users' collection
      Map<String, dynamic> childDataForParent = {
        'childId': child.id, // Use the form-provided ID
        'username': child.name, // Use child's name as username
        'grade': child.level, // Store the child's level/grade
      };

      // Update the parent's document to include the child in the 'children' array
      await FirebaseFirestore.instance
          .collection('users')
          .doc(parentUid)
          .update({
        'children': FieldValue.arrayUnion(
            [childDataForParent]), // Add child to parent's array
      });

      print('Child added successfully to parent\'s document and Firestore!');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ChildrenPage(),
        ),
      );
    } catch (e) {
      print('Failed to add child: $e');
    }
  }
}
