import 'package:apk/model/category.dart';
import 'package:apk/services/categories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  var categoryBasket = CategoriesModel(data: []).obs;
  var isLoading = true.obs;

  Future getCategorirs() async {
    try {
      isLoading(true);
      var data = await CategoryService.fetchCategory();
      if (data != null) {
        categoryBasket.value = data;
      }
    } catch (e) {
      debugPrint("$e");
    } finally {
      isLoading(false);
      debugPrint(categoryBasket.value.data.toString());
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getCategorirs();
    super.onInit();
  }
}
