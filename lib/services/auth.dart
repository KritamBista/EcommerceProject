import 'package:apk/model/login.dart';
import 'package:apk/model/register.dart';
import 'package:apk/utils/api.dart';
import 'package:flutter/material.dart';

class AuthService {
  static Future login(Map data) async {
    try {
      var response = await Api.dio.post("login", data: data);
      print(response.data);

      if (response.statusCode == 200) {
        return LoginModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("$e");
    } finally {
      debugPrint("connection closed");
    }
  }

  static Future register(Map data) async {
    try {
      var response = await Api.dio.post("register");
      if (response.statusCode == 200) {
        return RegisterModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("$e");
    } finally {
      debugPrint("connection closed");
    }
  }
}
