import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view/constant/data.dart';
import '../../database/local/cache_helper.dart';
import '../../database/network/dio_helper.dart';


part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());

  LogoutState get(context) => BlocProvider.of(context);



  void performLogout(BuildContext context) async {
    // SignupCubit.token = CacheHelper.get(key: accessTokenKey);
    // print('token =====> $SignupCubit.token');
    print(accessToken);
    try{
      emit(LogoutLoadingState());
     final response = await DioHelper.postData(
         url: "baseUrlAuth+logout",
       token: accessToken,
     );
     if (response.statusCode == 200) {
       CacheHelper.clearData();
       //context.push(LoginScreen());
       debugPrint('SUCCESS');
       emit(LogoutSuccessfulState());
     } else {
       debugPrint('Logout Failed ${response.statusCode}');
     }
    } catch (error) {
      debugPrint('Error During logout: ---> $error');
      emit(LogoutFailState());
    }
  }
}
