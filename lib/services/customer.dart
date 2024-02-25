import 'package:apk/model/customer.dart';
import 'package:apk/utils/api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CustomerService {
  static Future getCustomer(String token) async {
    try {
      var response = await Api.dio.get("/customer",
          options: Options(headers: {"Authorization": "Bearer $token"}));

      if (response.statusCode == 200) {
        return CustomerDetailModel.fromJson(response.data);
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
