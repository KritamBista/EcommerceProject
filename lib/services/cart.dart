import 'package:apk/model/cart.dart';
import 'package:apk/model/cart_items.dart';
import 'package:apk/utils/api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CartService {
  static Future addToCart(Map data, String token) async {
    try {
      print(token);

      var response = await Api.dio.post("cart",
          data: data,
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      if (response.statusCode == 200) {
        return CartModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("$e");
    } finally {
      debugPrint("Connnection Closed");
    }
  }

  static Future getCartItem(String token) async {
    try {
        print("Hello World");
      var response = await Api.dio.get("cart",
          options: Options(headers: {'Authorization': 'Bearer $token'}));
          print(response.data);
      if (response.statusCode == 200) {
        return CartItemModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("$e");
    } finally {
      debugPrint("Connnection Closed");
      
    }
  }
}
