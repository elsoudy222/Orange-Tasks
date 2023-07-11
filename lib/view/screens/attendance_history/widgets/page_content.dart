import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/core/custom_rich_text.dart';
import '../../../components/core/custom_text.dart';
import '../../../constant/color_manager.dart';

class AttendanceHistoryWidget extends StatelessWidget {
  const AttendanceHistoryWidget(
      {super.key,
        required this.title,
        required this.subtitle,
        required this.icon,
        required this.points,
      });

  final String title;
  final String subtitle;
  final Widget icon;
  final int points;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          color: const Color(0xFF100F12),
          boxShadow:  const [
            BoxShadow(
              color: Colors.black26,
              spreadRadius: 2.5,
            ),
          ],
          borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        title: CustomText(
          text: title,
          color: Color(0xFF454545),
        ),
        textColor: Colors.white,
        subtitle: CustomText(
          text: subtitle,
        ),
        trailing: Container(
          height: 47.h,
          width: 47.w,
          decoration:
          BoxDecoration(shape: BoxShape.circle, color: Colors.black),
          child: Center(
              child: CustomRichText(
                firstText: '$points',
                secondText: 'Pt',
                customFirstTextStyle: const TextStyle(
                  fontSize: 20,
                  color: mainColor,
                  fontWeight: FontWeight.bold,
                ),
                customSecondTextStyle: const TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              )),
        ),
        iconColor: Colors.white,

      ),
    );
  }
}