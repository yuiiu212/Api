import 'package:docdoc_app/core/Utilis/constans.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPre;

  static Future<void> init() async {
    sharedPre = await SharedPreferences.getInstance();
  }

  Future<void> setUserToken({
    required String userToken,
  }) async {
    await sharedPre.setString(
      Constants.kUserToken,
      userToken,
    );

    print('Token Saved');
  }

  String getuserToken() {
    return sharedPre.getString(
          Constants.kUserToken,
        ) ??
        '';
  }
}