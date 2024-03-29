import 'package:shared_preferences/shared_preferences.dart';
class HelperFunctions{
  static String userLoggedInKey = "LOGGEDINKEY";
  static String userNameKey = "USERNAMEKEY";
  static String userEmailKey = "USEREMAILKEY";

  static Future<bool>saveUserLoggedInStatus(bool isUserLoggedIN)async{
      SharedPreferences sf =await SharedPreferences.getInstance();
      return await sf.setBool(userLoggedInKey, isUserLoggedIN);
  }
  static Future<bool>saveUserNameSF(String userName)async{
      SharedPreferences sf =await SharedPreferences.getInstance();
      return await sf.setString(userNameKey, userName);
  }
  static Future<bool>saveUserEmailSF(String userEmail)async{
    SharedPreferences sf =await SharedPreferences.getInstance();
    return await sf.setString(userEmailKey, userEmail);
  }

  static Future<bool?> getUserLoggedInStatus() async{
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(userLoggedInKey);
  }
  static Future<String?> getUserEmailSF() async{
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userEmailKey);
  }
  static Future<String?> getUserNameSF() async{
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userNameKey);
  }
}
