import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../view_model/cubits/attendance/attendance_cubit.dart';
import '../../../components/core/custom_text.dart';
import '../../../constant/color_manager.dart';
import '../../../constant/fonts.dart';


class AttendanceButton extends StatefulWidget {
  const AttendanceButton({
    super.key,
  });

  @override
  State<AttendanceButton> createState() => _AttendanceButtonState();
}

class _AttendanceButtonState extends State<AttendanceButton>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    // to call isInLocation method without being Static to get emit state.
    context.read<AttendanceCubit>().isInLocation();
    // _animationController = AnimationController(
    //   vsync: this,
    //   duration: const Duration(seconds: 10),
    // )..repeat();
  }

  //
  // @override
  // void dispose() {
  //   _animationController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    AttendanceCubit attendanceCubit =
        BlocProvider.of<AttendanceCubit>(context, listen: true);
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: cardColor,
            blurRadius: 18,
            spreadRadius: 26,
            offset: const Offset(0, -20),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          attendanceCubit.onTap(context);
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 225,
              height: 225,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  300,
                ),
                border: Border.all(
                  color: AttendanceCubit.isActive == false
                      ? buttonColor
                      : mainColor,
                  width: 3,
                ),
              ),
            ),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  300,
                ),
                gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      buttonColor,
                      blackColor,
                    ]),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Column(
                  children: [
                    Text(
                      AttendanceCubit.isActive == false
                          ? AttendanceCubit.punchIn
                          : AttendanceCubit.punched,
                      style: TextStyle(
                          foreground: AttendanceCubit.isActive == false
                              ? AttendanceCubit.textColorDark
                              : AttendanceCubit.textColorOrange,
                          fontSize: textFont32,
                          fontWeight: FontWeight.w600),
                      // color: textColor,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    CustomText(
                      text: 'Office',
                      color: textColorFormField,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Container(
                      child: AttendanceCubit.isActive == true
                          ? CustomText(
                              text: DateFormat.jm('EN').format(DateTime.now()),
                              color: textColorFormField,
                            )
                          : null,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
