import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model/cubits/layout/layout_cubit.dart';
import 'constant/color_manager.dart';


class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {

    LayoutCubit layoutCubit = BlocProvider.of<LayoutCubit>(context, listen: true);
    return Scaffold(
      // appBar: AppBar(
      //   leading: BlocConsumer<ThemeCubit, ThemeStates>(
      //     listener: (context, state) {
      //     },
      //     builder: (context, state) {
      //       return IconButton(
      //         onPressed: () {
      //           ThemeCubit.get(context).changeAppTheme();
      //         },
      //         icon: ThemeCubit
      //             .get(context)
      //             .isDark == false
      //             ? Icon(Icons.brightness_2_outlined)
      //             : Icon(Icons.brightness_4_outlined),
      //       );
      //     },
      //   ),
      //   title: Text(cubit.titles[cubit.currentIndex],
      //     style: GoogleFonts.cairo(textStyle: TextStyle(fontSize: 20)),
      //   ),
      // ),
      body: layoutCubit.screens[layoutCubit.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: blackColor,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        items: layoutCubit.bottomNavBarItems,
        currentIndex: layoutCubit.currentIndex,
        onTap: (index) {
          layoutCubit.changeIndex(index);
        },
      ),
    );
  }
}
