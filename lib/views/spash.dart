import 'dart:async';

import 'package:apk/controller/cart_controller.dart';
import 'package:apk/controller/customer_controller.dart';
import 'package:apk/utils/string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashView extends StatefulWidget {
 const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  var cartController = Get.find<CartController>();
  var customerController = Get.find<CustomerController>();

  checkAuth() async {
    SharedPreferences p = await SharedPreferences.getInstance();
    var token = p.getString("token");

    if (token != null) {
      await cartController.getToCart(token);
      await customerController.getCustomer(token);

    print(cartController.cartItem.value.data.length);

      Get.offNamed(AppRoute.homeRoute);
    } else {
      Timer(const Duration(seconds: 3), () {
        Get.offNamed(AppRoute.loginRoute);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    checkAuth();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Ecommerce project",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
