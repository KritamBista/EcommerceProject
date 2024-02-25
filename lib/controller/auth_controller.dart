import 'package:apk/model/login.dart';
import 'package:apk/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var isLoading = true.obs;
  var loginBasket = LoginModel(data: null).obs;

  Future login(Map userData) async {
    try {
      isLoading(true);
      var data = await AuthService.login(userData);
      if (data != null) {
        loginBasket.value = data;
        print(data);
      }
    } catch (e) {
      debugPrint("$e");
    } finally {
      isLoading(false);
    }
  }
}
