part of 'attendance_cubit.dart';

@immutable
abstract class AttendanceState {}

class AttendanceInitial extends AttendanceState {}

class AttendanceSuccess extends AttendanceState {}

class AttendancePunched extends AttendanceState {}

class AttendanceFail extends AttendanceState {}
