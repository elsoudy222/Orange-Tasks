import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'attendance_history_state.dart';

class AttendanceHistoryCubit extends Cubit<AttendanceHistoryState> {
  AttendanceHistoryCubit() : super(AttendanceHistoryInitial());

  static AttendanceHistoryCubit get(context) => BlocProvider.of(context);

  int week = 1;

  void increaseWeek(){
    week++;

    emit(IncreaseWeekState());
  }

  void decreaseWeek(){
    week--;
    emit(DecreaseWeekState());
  }





}
