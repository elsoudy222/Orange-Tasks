import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../view/constant/assets.dart';
import '../../../view/constant/color_manager.dart';
import '../../../view/screens/attendance_screen/attendance_screen.dart';
import 'layout_states.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitialState());

  static LayoutCubit get(context) => BlocProvider.of(context);

  var currentIndex = 0;

  // List<String> titles = [
  //   '',
  //   'الأذكار',
  //   'السبحة الإلكترونية',
  // ];

  // todo: call right screens.
  List<Widget> screens = const [
    AttendanceScreen(),
    AttendanceScreen(),
    AttendanceScreen(),
  ];

  List<BottomNavigationBarItem> bottomNavBarItems = [
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        screen,
      ),
      activeIcon: Container(
          decoration:  const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: shadowColor,
                blurRadius: 12,
                spreadRadius: 9,
                offset: Offset(0, -4),
              ),
            ],
          ),
          child: SvgPicture.asset(
            screenActive,
          )),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(video),
      activeIcon: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: shadowColor,
                blurRadius: 12,
                spreadRadius: 9,
                offset: Offset(0, -6),
              ),
            ],
          ),
          child: SvgPicture.asset(videoActive)),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(flag),
      activeIcon: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: shadowColor,
                blurRadius: 12,
                spreadRadius: 9,
                offset: Offset(0, -4),
              ),
            ],
          ),
          child: SvgPicture.asset(flagActive)),
      label: '',
    ),
  ];

  void changeIndex(index) {
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }
}
