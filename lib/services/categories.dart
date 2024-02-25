import 'package:apk/model/category.dart';
import 'package:apk/utils/api.dart';
import 'package:flutter/material.dart';

class CategoryService {
 static Future fetchCategory() async {
    try {
      var response = await Api.dio.get("categories");
      if (response.statusCode == 200) {
        return CategoriesModel.fromJson(response.data);
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
