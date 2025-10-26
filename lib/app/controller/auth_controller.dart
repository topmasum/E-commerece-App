import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_based_ecommerce/features/share/data/models/usermodel.dart';

class AuthController{
  final String _tokenKey='access-token';
  final String _userDataKey='user-model';
  String? accessToken;
  UserModel? userModel;
  Future<void> saveUserData(UserModel model, String token) async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    await sharedPreferences.setString(_tokenKey, token);
    await sharedPreferences.setString(_userDataKey, jsonEncode(model.toJson()));
    accessToken=token;
    userModel=model;

}
  Future<void> loadUserData() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    accessToken = sharedPreferences.getString(_tokenKey);
    userModel=UserModel.fromJson(jsonDecode(sharedPreferences.getString(_userDataKey)!));
  }

  /// ✅ Check if user is already logged in
  Future<bool> alreadyLoggedIn() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String? token = sharedPreferences.getString(_tokenKey);
    final String? userJson = sharedPreferences.getString(_userDataKey);

    if (token != null && userJson != null) {
      accessToken = token;
      userModel = UserModel.fromJson(jsonDecode(userJson));
      return true;
    }
    return false;
  }

  /// ✅ Clear user data (logout)
  Future<void> clearUserData() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();

  }
}
