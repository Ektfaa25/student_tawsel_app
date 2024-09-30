import 'package:flutter/material.dart';
import 'package:student_tawsel/features/auth/persentation/login_parent_page.dart';
import 'package:student_tawsel/features/add_child/presentation/add_child_page.dart';
import 'package:student_tawsel/features/presentantion/widgets/button_widget.dart';
import 'package:student_tawsel/features/presentantion/widgets/app_bar_back_ground_widget.dart';
import 'package:student_tawsel/features/presentantion/widgets/form_field_widget.dart';

class LoginStudentPage extends StatefulWidget {
  const LoginStudentPage({super.key});

  @override
  State<LoginStudentPage> createState() => _LoginStudentPageState();
}

class _LoginStudentPageState extends State<LoginStudentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        backgroundColor: Colors.white,
        flexibleSpace: Stack(children: [
          Positioned(
            right: 100,
            left: 1,
            top: -30,
            child: Image.asset(
              "assets/pngtree-template-of-fluid-organic-shapes-picture-image_8114472 1.png",
            ),
          ),
          const AppBarBackGroundWidget()
        ]),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Login",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(
                  height: 77,
                ),
                FormFieldWidget(
                  controller: TextEditingController(),
                  label: "Email",
               
                ),
                const SizedBox(
                  height: 31,
                ),
                FormFieldWidget(
                  controller: TextEditingController(),
                  label: "Password",
                 
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Forgot your Password?",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                ButtonWidget(
                  onPressed: () {},
                  label: "LOGIN",
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const LoginParentPage();
                    }));
                  },
                  child: const Text(
                    "Login As Parent?",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff09206A)),
                  ),
                ),
                const SizedBox(
                  height: 51,
                ),
                const Text(
                  "Management Education Serves\n   And Buses At Your Home",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
