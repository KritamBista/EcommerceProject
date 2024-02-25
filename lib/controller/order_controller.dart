import 'package:apk/model/order.dart';
import 'package:apk/services/order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  var isLoading = true.obs;
  var order = OrderModel(data: null).obs;
  Future postOrder( var postOrder ,String token) async {
    try {
      isLoading(true);
      var data = await OrderService.postOrder(postOrder ,token);
      if (data != null) {
        order.value = data;
      }
    } catch (e) {
      debugPrint("$e");
    } finally {
      isLoading(false);
    }
  }
}
