import 'package:apk/model/product.dart';
import 'package:apk/model/product_single.dart';
import 'package:apk/services/products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var productBasket = ProductModel(data: []).obs;
  var singlProduct = ProductDetailModel(data: null).obs;
  var isLoading = true.obs;
  var a = 1.obs;
  Future getProducts() async {
    try {
      isLoading(true);
      var data = await ProductService.fetchProduct();
      if (data != null) {
        productBasket.value = data;
      }
    } catch (e) {
      debugPrint("$e");
    } finally {
      isLoading(false);
      debugPrint("Conncetion closed");
    }
  }

  Future getProductsByCategory(var id) async {
    try {
      isLoading(true);
      var datax = await ProductService.fetchProductByCategory(id);
      if (datax != null) {
        productBasket.value = datax;
      }
    } catch (e) {
      debugPrint("$e");
    } finally {
      isLoading(false);
      debugPrint("Conncetion closed");
    }
  }

  Future getProductsDetail(var id) async {
    try {
      isLoading(true);
      var data = await ProductService.fetchProductDetails(id);
      if (data != null) {
        singlProduct.value = data;
      }
    } catch (e) {
      debugPrint("$e");
    } finally {
      isLoading(false);
      debugPrint("Conncetion closed");
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProducts();
  }

  onAdd() {
    a++;
  }

  void onRemove() {
    a--;
    if (a <= 1) {
      a = 1.obs;
    }
  }
}
