import 'package:apk/model/order.dart';
import 'package:apk/utils/api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class OrderService {
  static Future postOrder(Map data ,var token) async {
    try {
      var response = await Api.dio.post("/order",data: data,
          options: Options(headers: {"Authorization": "Bearer $token"}));

      if (response.statusCode == 200) {
        return OrderModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("$e");
    } finally {
      debugPrint("Connection Closed");
    }
  }
}
