// import '../model/data/user_data.dart';
//
// UserData? userData;
import 'package:flutter_pw_validator/Resource/Strings.dart';


String? currentLangCode;

//UserModel? user;
//Tokens
String accessToken = "";

//SharedPreferences Keys
const String accessTokenKey = "token";
//validations
String validationEmail =
    r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";
String validationPassword =
    r'(?=[A-Za-z0-9@#$%^&+!=]+$)^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[@#$%^&+!=])(?=.{8,}).*$';
String validationName = r'^[a-z A-Z]+$';
String validationPhone = r'(^(?:[+0]9)?[0-9]{10,12}$)';

// Routers
// todo: add new screens
const String verifyEmailScreen = 'VerifyEmailScreen';
const String forgetPasswordScreen = 'ForgetPasswordScreen';
const String createNewPasswordScreen = 'CreateNewPasswordScreen';
const String loginScreen = 'LoginScreen';
const String createPasswordScreen = 'CreatePasswordScreen';
const String myProfileScreen = 'myProfileScreen';
// User Screens
const String layout = 'layout';
const String attendanceScreen = 'attendanceScreen';
const String questsScreen = 'questsScreen';
const String attendanceHistoryScreen = 'attendanceHistoryScreen';

// Password valid Class
class PasswordValidPlugin extends FlutterPwValidatorStrings {
  @override
  final String atLeast = '8 Characters minimum';
  @override
  final String uppercaseLetters = 'One uppercase character';
  @override
  final String specialCharacters = 'One special character';
  @override
  final String lowercaseLetters = "One lowercase character";
}
