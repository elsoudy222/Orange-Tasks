import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_odc_tasks/view/components/core/custom_text.dart';
import 'package:my_odc_tasks/view/constant/color_manager.dart';

import '../../../../model/quests_model.dart';
import '../../../components/core/custom_rich_text.dart';

class QuestsLowerSection extends StatelessWidget {
  QuestsLowerSection({super.key});

  List<QuestsModel> activity = [
    // 1:
    QuestsModel(
      title: "Attendance",
      subtitle: "Take Your Attendance",
      totalPoints: 3,
      icon: SvgPicture.asset("assets/svg/attendance_check.svg",height: 30,width: 30,),
    ),
    // 2:
    QuestsModel(
      title: "Sprint",
      subtitle: "Finishing the Sprint",
      totalPoints: 10,
      icon: SvgPicture.asset("assets/svg/sprints.svg",height: 30,width: 30,),
    ),
    // 3:
    QuestsModel(
      title: "Custom Quest",
      subtitle: "Team Review",
      totalPoints: 2,
      icon: SvgPicture.asset("assets/svg/quest.svg",height: 30,width: 30,),
    ),
    // 4:
    QuestsModel(
      title: "Custom Quest",
      subtitle: "Complete Admin Scenario",
      totalPoints: 5,
      icon: SvgPicture.asset("assets/svg/quest.svg",height: 30,width: 30,),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360.h,
      width: 500.w,
      decoration: BoxDecoration(
        color: const Color(0xFF121114),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            spreadRadius: 2.5,
          ),
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: activity.length,
            itemBuilder: (context, index) {
              return ActivityCardWidget(
                title: activity[index].title,
                subtitle: activity[index].subtitle,
                icon: activity[index].icon,
                points: activity[index].totalPoints,
              );
            },
          ),
        ),
      ),
    );
  }
}

class ActivityCardWidget extends StatelessWidget {
  const ActivityCardWidget(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.icon,
      required this.points});

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
          boxShadow: const [
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
        leading: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: icon,
        ),
      ),
    );
  }
}
