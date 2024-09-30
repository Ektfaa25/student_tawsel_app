import 'package:flutter/material.dart';
import 'package:student_tawsel/features/presentantion/pages/add_child_page.dart';
import 'package:student_tawsel/features/presentantion/widgets/button_widget.dart';
import 'package:student_tawsel/features/presentantion/widgets/form_field_widget.dart';

class OTP extends StatelessWidget {
  const OTP();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "OTP",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FormFieldWidget(
                controller: TextEditingController(), label: "OTP", ),
            const SizedBox(
              height: 10,
            ),
            ButtonWidget(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddChildPage()),
                );
              },
              label: "LOGIN",
            ),
          ],
        ),
      ),
    );
  }
 
}
