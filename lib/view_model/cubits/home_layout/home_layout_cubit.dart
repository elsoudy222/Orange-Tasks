import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta/meta.dart';
import 'package:my_odc_tasks/view/screens/home/home/home_screen.dart';
import 'package:my_odc_tasks/view/screens/home/search/search_screen.dart';

import '../../../view/constant/assets.dart';
import '../../../view/constant/color_manager.dart';
import '../../../view/screens/attendance_screen/attendance_screen.dart';

part 'home_layout_state.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutState> {
  HomeLayoutCubit() : super(HomeLayoutInitial());

  static HomeLayoutCubit get(context) => BlocProvider.of(context);

  var currentIndex = 0;



  // todo: call right screens.
  List<Widget> screens = const [
    HomeScreen(),
    SearchScreen(),
    HomeScreen()

  ];

  List<BottomNavigationBarItem> bottomNavBarItems = [
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        screen,
      ),
      activeIcon: Container(
          decoration:   const BoxDecoration(
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
            softwareLogo,
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
