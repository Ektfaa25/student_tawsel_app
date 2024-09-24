import 'package:flutter/material.dart';
import 'package:student_tawsel/core/theme/app_pallete.dart';

class LatestNoticesCardContentWidget extends StatelessWidget {
  final String name;
  final String profession;
  final String message;
  final String additionalInfo;

  const LatestNoticesCardContentWidget({
    super.key,
    required this.name,
    required this.profession,
    required this.message,
    required this.additionalInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppPallete.secondaryColor,
      margin: const EdgeInsets.only(
        left: 18,
        right: 19,
        top: 18,
      ),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(11),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 15, right: 12, top: 14, bottom: 17),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff2D2828),
                        )),
                const SizedBox(height: 8),
                Text('$profession\n$additionalInfo',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w400,
                        )),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Message',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w300,
                      decoration: TextDecoration.underline,
                      color: const Color(0xff2D2828)),
                ),
                const SizedBox(height: 8),
                Text(
                  message,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                      color: const Color(0xff2D2828)),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
