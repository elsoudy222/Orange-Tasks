import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import '../../../view/constant/color_manager.dart';

part 'attendance_state.dart';

class AttendanceCubit extends Cubit<AttendanceState> {
  AttendanceCubit() : super(AttendanceInitial());

  AttendanceCubit get(context) => BlocProvider.of(context);

  static var textColorDark = Paint()..shader = textLinearGradient;
  static var textColorOrange = Paint()..shader = orangeTextLinearGradient;
  static const String punchIn = 'Punch in';
  static const String punched = 'Punched';
  String timeArrived = '';
  static bool isActive = false;
  static String lat = '';
  static String long = '';

  //Home
  // static String odcLat = '30.002292730083173';

  // ODC
  // static String odcLat = '30.0722672927097';

  //Simulator
  // static String odcLat = '31.23001';

  //Emulator
  static String odcLat = '37.4219983';

  //Home
  // static String odcLong = '31.192771922750975';

  // ODC
  // static String odcLong = '31.228579812310652';

  //Simulator
  // static String odcLong = '30.0710913';

  //Emulator
  static String odcLong = '-122.084';

  // Request Location permission.
  static Future<Position> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location Permission are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location Permission are permanently denied, we cannot request');
    }
    return await Geolocator.getCurrentPosition();
  }

  // Get lat & long then Check if User in Odc or Not.
  void isInLocation() {
    getCurrentLocation().then((value) {
      lat = '${value.latitude}';
      long = '${value.longitude}';
      debugPrint('lat is ====> $lat');
      debugPrint('long is ====> $long');
      if (long == odcLong && lat == odcLat) {
        isActive = true;
        debugPrint('Success');
        emit(AttendanceSuccess());
      } else {
        debugPrint('Fail');
        emit(AttendanceFail());
      }
    });
  }

  void onTap(var context) {
    timeArrived = DateFormat.jm('EN').format(DateTime.now());
    debugPrint(timeArrived);
    if (isActive == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: buttonColor,
          duration: const Duration(seconds: 1),
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          content: const Center(
            child: Text(
              'Punched!',
            ),
          ),
        ),
      );
      emit(AttendancePunched());
    }
    isActive = false;
  }
}
