import 'package:flutter/material.dart';
import 'package:student_tawsel/generated/l10n.dart';

class PasswordChangeWidget extends StatelessWidget {
  const PasswordChangeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 507,
      width: 390,
      decoration: const BoxDecoration(
          color: Color(0xffF9F9F9),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(34),
            topRight: Radius.circular(34),
          )),
      child: Padding(
        padding: const EdgeInsets.only(top: 4, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 5,
              width: 50,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            Text(S.of(context).passwordchange,
                style: const TextStyle(
                  fontFamily: "Tajawal",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff222222),
                )),
            const SizedBox(
              height: 28,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                    width: 343,
                    height: 64,
                    child: Card(
                      elevation: 0,
                      color: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(
                              color: Color(0xff9B9B9B),
                              fontFamily: "Tajawal",
                              fontSize: 14,
                              fontWeight: FontWeight.normal),
                          hintText: S.of(context).oldpassword,
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(
                                Radius.circular(4),
                              )),
                        ),
                      ),
                    )),
                const SizedBox(height: 14),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(S.of(context).forgetpassword,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontFamily: "Tajawal",
                        fontSize: 14,
                        color: Color(0xff9B9B9B),
                      )),
                ),
                const SizedBox(height: 16),
                Column(
                  children: [
                    Container(
                        width: 343,
                        height: 64,
                        color: Colors.white,
                        child: TextField(
                          textInputAction: TextInputAction.newline,
                          decoration: InputDecoration(
                            hintStyle: const TextStyle(
                                color: Color(0xff9B9B9B),
                                fontFamily: "Tajawal",
                                fontSize: 14,
                                fontWeight: FontWeight.normal),
                            hintText: S.of(context).newpassword,
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(4),
                                )),
                          ),
                        )),
                    const SizedBox(height: 16),
                    Container(
                        width: 343,
                        height: 64,
                        color: Colors.white,
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintStyle: const TextStyle(
                                color: Color(0xff9B9B9B),
                                fontFamily: "Tajawal",
                                fontSize: 14,
                                fontWeight: FontWeight.normal),
                            hintText: S.of(context).repeatnewpassword,
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(6),
                                )),
                          ),
                        )),
                  ],
                ),
              ],
            ),
            Container(
              height: 61,
              width: 300,
              decoration: const BoxDecoration(
                color: Color(0xff182243),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              margin: const EdgeInsets.only(top: 42, left: 48, right: 48),
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(S.of(context).savepassword,
                    style: const TextStyle(
                      fontFamily: "Inter",
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
