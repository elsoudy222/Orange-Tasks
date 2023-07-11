import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart'; //for date format
import 'package:intl/date_symbol_data_local.dart';
import 'package:my_odc_tasks/view/screens/attendance_screen/widgets/attendance_button.dart';
import 'package:my_odc_tasks/view/screens/attendance_screen/widgets/attendance_lower_section.dart';

import '../../components/core/custom_appbar.dart';
import '../../components/core/custom_text.dart';
import '../../components/core/scaffold_custom/scaffold_custom.dart';
import '../../constant/assets.dart';
import '../../constant/color_manager.dart';
import '../../constant/data.dart';
import '../../constant/fonts.dart'; //for date locale


class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  @override
  void initState() {
    initializeDateFormatting(); // Initial dateFormatter package before Run code.
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldCustom(
      appBarCustom: CustomAppBar(
        title: 'Attendance',
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: DateFormat.EEEE('EN').format(DateTime.now()),
                    color: mainColor,
                    fontSize: textFont26,
                    fontWeight: FontWeight.w600,
                  ),
                  CustomText(
                    text: DateFormat.yMd('EN').format(DateTime.now()),
                    color: textColorFormField,
                    fontWeight: FontWeight.w600,
                    fontSize: textFont16,
                  ),
                ],
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, attendanceHistoryScreen);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    color: cardColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: SvgPicture.asset(history),
                  ),
                ),
              ),
            ],
          ),
          const AttendanceButton(),
          const AttendanceLowerSection(),
        ],
      ),
    );
  }
}
