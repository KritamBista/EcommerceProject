import 'package:apk/model/product.dart';
import 'package:apk/model/product_single.dart';
import 'package:apk/utils/api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProductService {
  static Future fetchProduct() async {
    try {
      var response = await Api.dio.get("products");
      if (response.statusCode == 200) {
        return ProductModel.fromJson(response.data);
      } else {
        return "not found";
      }
    } catch (e) {
      debugPrint("$e");
    } finally {}
  }

  static Future fetchProductDetails(var id) async {
    try {
      var response = await Api.dio.get('products/$id');
      if (response.statusCode == 200) {
        return ProductDetailModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("$e");
    } finally {}
  }

  static Future fetchProductByCategory(var id) async {
    try {
      var response = await Api.dio.get('categories/$id');
      if (response.statusCode == 200) {
        return ProductModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("$e");
    } finally {}
  }
}
