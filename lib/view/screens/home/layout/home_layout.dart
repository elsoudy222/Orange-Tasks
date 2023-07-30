import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../view_model/cubits/home_layout/home_layout_cubit.dart';
import '../../../../view_model/cubits/home_layout/home_layout_cubit.dart';
import '../../../../view_model/cubits/home_layout/home_layout_cubit.dart';
import '../../../constant/color_manager.dart';


class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit, HomeLayoutState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = HomeLayoutCubit.get(context);
        return Scaffold(

          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            items: cubit.bottomNavBarItems,
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeIndex(index);
            },
          ),
        );
      },
    );
  }
}
