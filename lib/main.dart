import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_odc_tasks/view/constant/color_manager.dart';
import 'package:my_odc_tasks/view/constant/data.dart';
import 'package:my_odc_tasks/view/constant/navigation_service.dart';
import 'package:my_odc_tasks/view/constant/observer.dart';
import 'package:my_odc_tasks/view/constant/theme.dart';
import 'package:my_odc_tasks/view/layout.dart';
import 'package:my_odc_tasks/view/screens/attendance_history/attendance_history_screen.dart';
import 'package:my_odc_tasks/view/screens/attendance_screen/attendance_screen.dart';
import 'package:my_odc_tasks/view/screens/forget_password/by_email/forget_password_email_screen.dart';
import 'package:my_odc_tasks/view/screens/forget_password/by_phone/forget_password_phone_screen.dart';
import 'package:my_odc_tasks/view/screens/forget_password/new_password/new_password_screen.dart';
import 'package:my_odc_tasks/view/screens/quests/quests_screen.dart';
import 'package:my_odc_tasks/view/screens/splash/splash_screen.dart';
import 'package:my_odc_tasks/view_model/cubits/attendance/attendance_cubit.dart';
import 'package:my_odc_tasks/view_model/cubits/attendance_history/attendance_history_cubit.dart';
import 'package:my_odc_tasks/view_model/cubits/layout/layout_cubit.dart';
import 'package:my_odc_tasks/view_model/cubits/theme/theme_cubit.dart';
import 'package:my_odc_tasks/view_model/database/local/cache_helper.dart';
import 'package:my_odc_tasks/view_model/database/network/dio_helper.dart';

import 'package:timezone/data/latest.dart' as time_zone;


Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await CacheHelper.init();
  await DioHelper.init();
  Bloc.observer = MyBlocObserver();
  Intl.defaultLocale = 'ar_SA';
  time_zone.initializeTimeZones();
  runApp(
    MultiBlocProvider(
      providers: [

        BlocProvider(create: (context) => LayoutCubit(),),
        BlocProvider(create: (context) => AttendanceCubit(),),
        BlocProvider(create: (context) => AttendanceHistoryCubit(),),
        BlocProvider(create: (context) => ThemeCubit(),),

        // BlocProvider(create: (context) => UsersCubit()..getPost()),
        // BlocProvider(create: (context) => ScreenShootCubit()..disableCapture()),
        // BlocProvider(create: (context) => ForgetPasswordCubit()),
        // BlocProvider(create: (context) => SocketCubit()..socketListener()),
        // BlocProvider(create: (context) => UpdateDetailsCubit()),
        // BlocProvider(create: (context) => PartnerAccountCubit()),
        // BlocProvider(create: (context) => OrderCubit()),
        // BlocProvider(create: (context) => NotificationsCubit()),
        // BlocProvider(create: (context) => ProfileCubit()),
        // BlocProvider(create: (context) => CompanyDetailsSupportCubit()..getCompanyDetails()),
        //BlocProvider(create: (context) => NeedHelpSupportCubit()..getCompaniesSupport())
      ],
      child: EasyLocalization(
        path: "resources/langs",
        supportedLocales: const [
          Locale('en', 'EN'),
          Locale('ar', 'AR'),
        ],
        //fallbackLocale: Locale('en'),
        saveLocale: true,
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ThemeCubit.get(context).isDark
          ? darkBackground
          : grey100, // Set your desired color here
    ));

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          navigatorKey: NavigationService.instance.navigationKey,
          // initialRoute: '/',
          // routes: {
          //   '/': (context) => SplashScreen()
          // },
          debugShowCheckedModeBanner: false,
          theme: buildLightMode(context),
          darkTheme: buildDarkMode(context),
          themeMode:
          ThemeCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
           home: NewPasswordScreen(),
        );
      },
    );
  }
}