part of 'attendance_history_cubit.dart';

@immutable
abstract class AttendanceHistoryState {}

class AttendanceHistoryInitial extends AttendanceHistoryState {}
class IncreaseWeekState extends AttendanceHistoryState {}
class DecreaseWeekState extends AttendanceHistoryState {}
