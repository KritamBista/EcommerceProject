import 'package:apk/model/cart.dart';
import 'package:apk/model/cart_items.dart';
import 'package:apk/services/cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var carts = CartModel(data: null).obs;
  var cartItem = CartItemModel(data: []).obs;
  var total = 0.obs;

  var isLoading = true.obs;
  Future addToCart(var cartData, String token) async {
    try {
      isLoading(true);
      var data = await CartService.addToCart(cartData, token);
      if (data != null) {
        carts.value = data;
      }
    } catch (e) {
      debugPrint("$e");
    } finally {
      isLoading(false);
    }
  }

  Future getToCart(String token) async {
    try {
      isLoading(true);
      var data = await CartService.getCartItem(token);
      if (data != null) {
        cartItem.value = data;
        total =0.obs;

        for (var item in cartItem.value.data) {
          total = total + item.amount!;
        }
      
      }
    } catch (e) {
      debugPrint("$e");
    } finally {
      isLoading(false);
    }
  }
}
