import 'package:apk/model/customer.dart';
import 'package:apk/services/customer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerController extends GetxController {
  var isLoading = true.obs;
  var customerModel = CustomerDetailModel(data: null).obs;

  Future getCustomer(String token) async {
    try {
      isLoading(true);
      var data = await CustomerService.getCustomer(token);
      if (data != null) {
        customerModel.value = data;
      }
    } catch (e) {
      debugPrint("$e");
    } finally {
      isLoading(false);
    }
  }
}
