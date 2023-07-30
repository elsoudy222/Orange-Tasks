import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_odc_tasks/view/profile_screen_items.dart';
import 'package:my_odc_tasks/view/theme_mode_animation.dart';

import '../view_model/cubits/logout/logout_cubit.dart';
import '../view_model/cubits/theme/theme_cubit.dart';
import 'components/core/custom_text.dart';
import 'constant/assets.dart';
import 'constant/color_manager.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    ThemeCubit themeCubit = ThemeCubit.get(context);
    LogoutCubit logoutCubit = BlocProvider.of(context, listen: true);
    return SingleChildScrollView(
      child: BlocConsumer<ThemeCubit, ThemeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.all(10.0.h),
                      child: SvgPicture.asset(
                        arrowBack,
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  CustomText(
                    text: 'Profile',
                    color: mainColor,
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            color: mainColor,
                            child: Image.asset(
                              "profilePicture",
                              width: 77,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 16.h,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                text: 'Sara Mohamed',
                                color:
                                    themeCubit.isDark ? white : darkBackground,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              CustomText(
                                text: 'Cairo, Egypt',
                                color: themeCubit.isDark ? grey600 : grey800,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 32.h,
                        ),
                        CustomText(
                          text: 'Personal Info',
                          color: grey600,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        ProfileScreenItems(
                          prefixIcon: SvgPicture.asset(
                            more,
                            colorFilter: ColorFilter.mode(
                                themeCubit.isDark ? white : grey800,
                                BlendMode.srcIn),
                          ),
                          title: 'Edit',
                          onTap: () {},
                        ),
                        ProfileScreenItems(
                          prefixIcon: SvgPicture.asset(
                            "assets/icons/history.svg",
                            colorFilter: ColorFilter.mode(
                                themeCubit.isDark ? white : grey800,
                                BlendMode.srcIn),
                          ),
                          suffixIcon: const ThemeModeAnimation(),
                          title: 'Night Mode',
                          onTap: () {},
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomText(
                          text: 'Support',
                          color: grey600,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        ProfileScreenItems(
                          prefixIcon: SvgPicture.asset(
                            "assets/icons/history.svg",
                            colorFilter: ColorFilter.mode(
                                themeCubit.isDark ? white : grey800,
                                BlendMode.srcIn),
                          ),
                          title: 'Orange Help Center',
                          onTap: () {},
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        CustomText(
                          text: 'About',
                          color: grey600,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        ProfileScreenItems(
                          prefixIcon: SvgPicture.asset(
                            "assets/icons/history.svg",
                            colorFilter: ColorFilter.mode(
                                themeCubit.isDark ? white : grey800,
                                BlendMode.srcIn),
                          ),
                          title: 'About Orange Digital Center',
                          onTap: () {},
                        ),
                        ProfileScreenItems(
                          prefixIcon: SvgPicture.asset(
                            "assets/icons/history.svg",
                            colorFilter: ColorFilter.mode(
                                themeCubit.isDark ? white : grey800,
                                BlendMode.srcIn),
                          ),
                          title: 'LogOut',
                          onTap: () {
                            logoutCubit.performLogout(context);
                          },
                        ),
                        ProfileScreenItems(
                          prefixIcon: SvgPicture.asset(
                            "assets/icons/history.svg",
                            colorFilter: const ColorFilter.mode(redColor, BlendMode.srcIn),
                          ),
                          title: 'Delete Account',
                          onTap: () {},
                          isDelete: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
