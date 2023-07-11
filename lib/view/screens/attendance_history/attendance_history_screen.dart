import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_odc_tasks/view/components/core/custom_rich_text.dart';
import 'package:my_odc_tasks/view_model/cubits/attendance_history/attendance_history_cubit.dart';

import '../../components/core/custom_appbar.dart';
import '../../components/core/scaffold_custom/scaffold_custom.dart';
import '../../constant/color_manager.dart';

class AttendanceHistoryScreen extends StatefulWidget {
  const AttendanceHistoryScreen({super.key});

  @override
  State<AttendanceHistoryScreen> createState() => _AttendanceHistoryScreen();
}

class _AttendanceHistoryScreen extends State<AttendanceHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AttendanceHistoryCubit, AttendanceHistoryState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var attendanceCubit = AttendanceHistoryCubit.get(context);
        return ScaffoldCustom(
          appBarCustom: CustomAppBar(
            title: 'Attendance History',
          ),
          body: Column(
            children: [
              Container(
                height: 60.h,
               // color: Colors.grey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    attendanceCubit.week >= 2 && attendanceCubit.week <= 4
                        ? GestureDetector(
                            onTap: () {
                              attendanceCubit.decreaseWeek();
                            },
                            child: Container(
                              height: 34,
                              width: 34,
                              decoration: BoxDecoration(
                                color: Color(0xFF1B1A1C),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(
                                Icons.arrow_back_ios_rounded,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          )
                        : Container(),
                    CustomRichText(
                      firstText: "Week",
                      customFirstTextStyle: const TextStyle(
                        fontSize: 25,
                        color: mainColor,
                        fontWeight: FontWeight.bold,
                      ),
                      customSecondTextStyle: const TextStyle(
                        fontSize: 25,
                        color: mainColor,
                        fontWeight: FontWeight.bold,
                      ),
                      secondText: "${attendanceCubit.week}",
                    ),
                    GestureDetector(
                      onTap: () {
                        attendanceCubit.week <= 3
                            ? attendanceCubit.increaseWeek()
                        : null;
                        setState(() {
                          // TODO: Go to next page view
                        });
                      },
                      child: Container(
                        height: 34,
                        width: 34,
                        decoration: BoxDecoration(
                          color: Color(0xFF1B1A1C),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Expanded(
                child: PageView.builder(
                  
                  itemBuilder: (context,index){
                  return Container(
                   // color: Colors.white,
                  );
                },),
              ),
            ],
          ),
        );
      },
    );
  }
}
