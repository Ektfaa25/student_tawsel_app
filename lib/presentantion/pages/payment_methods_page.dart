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
      appBar: AppBar(
        flexibleSpace: const AppBarBackGroundWidget(),
        title: Text(
          S.of(context).paymentMethods,
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(23),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).yourpaymentcards,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
            ),
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
                Text(
                  S.of(context).defaultpaymentmethod,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
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
                Text(
                  S.of(context).defaultpaymentmethod,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
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
