import 'package:flutter_fic10/data/models/responses/auth_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDataSource {
  Future<void> saveAuthData(AuthResponseModel authResponseModel) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString('auth_data', authResponseModel.toJson());
  }

  Future<void> removeAuthData() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove('auth_data');
  }

  Future<AuthResponseModel?> getAuthData() async {
    final pref = await SharedPreferences.getInstance();
    final authData = pref.getString('auth_data');
    if (authData != null) {
      return AuthResponseModel.fromJson(authData);
    } else {
      // return AuthResponseModel.fromJson(authData);
      return null;
    }
  }
}
