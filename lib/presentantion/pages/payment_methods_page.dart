import 'package:flutter/material.dart';
import 'package:student_tawsel/generated/l10n.dart';
import 'package:student_tawsel/presentantion/widgets/app_bar_back_ground_widget.dart';

import 'package:student_tawsel/presentantion/widgets/visa_card_widget.dart';
import 'package:student_tawsel/presentantion/widgets/master_card_widget.dart';

class PaymentMethodsPage extends StatelessWidget {
  const PaymentMethodsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 139,
        flexibleSpace: const AppBarBackGroundWidget(),
        title: Text(
          S.of(context).paymentMethods,
          style: const TextStyle(
            fontFamily: "Inter",
            fontWeight: FontWeight.bold,
            fontSize: 32,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xff182243),
        automaticallyImplyLeading: false,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(22),
            bottomRight: Radius.circular(22),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(23),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(S.of(context).yourpaymentcards,
                style: const TextStyle(
                    fontFamily: "Tajawal",
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xff222222))),
            const MasterCardWidget(),
            Row(
              children: [
                Checkbox(
                    value: true,
                    activeColor: const Color(0xff222222),
                    onChanged: (value) {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    )),
                Text(S.of(context).defaultpaymentmethod,
                    style: const TextStyle(
                        fontFamily: "Tajawal",
                        color: const Color(0xff222222),
                        fontSize: 14)),
              ],
            ),
            const VisaCardWidget(),
            Row(
              children: [
                Checkbox(
                    value: false,
                    activeColor: const Color(0xff222222),
                    onChanged: (value) {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    )),
                Text(S.of(context).defaultpaymentmethod,
                    style: const TextStyle(
                        fontFamily: "Tajawal",
                        color: Color(0xff222222),
                        fontSize: 14)),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {},
        backgroundColor: const Color(0xff222222),
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
