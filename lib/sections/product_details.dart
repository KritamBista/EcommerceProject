import 'package:apk/controller/cart_controller.dart';
import 'package:apk/controller/product_controller.dart';
import 'package:apk/utils/appsize.dart';
import 'package:apk/utils/string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductDetailSection extends StatelessWidget {
  ProductDetailSection({super.key});
  var cartContoller = Get.find<CartController>();
  var productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (productController.isLoading.value == true) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Column(
          children: [
            Image.network(
                "${productController.singlProduct.value.data?.image}"),
            Text("${productController.singlProduct.value.data?.name}"),
            productController.singlProduct.value.data!.discount == true
                ? Text(
                    "${productController.singlProduct.value.data?.price}",
                    style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.red),
                  )
                : const SizedBox(),
            Text("${productController.singlProduct.value.data?.sellingPrice}"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.add_circle),
                  onPressed: () {
                    productController.onAdd();
                  },
                ),
                Text("${productController.a}"),
                IconButton(
                  icon: const Icon(Icons.remove_circle),
                  onPressed: () {
                    productController.onRemove();
                  },
                ),
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding:  EdgeInsets.symmetric(
                          horizontal: AppSize.p16, vertical: AppSize.p12),
                      textStyle:  TextStyle(fontSize: AppSize.p16),
                      elevation: 3.0,
                    ),
                    onPressed: () async {
                      SharedPreferences p =
                          await SharedPreferences.getInstance();
                      var token = p.getString("token");
                      if (token == null) {
                        Get.offAllNamed(AppRoute.loginRoute);
                      } else {
                        Map data = {
                          "product_id":
                              productController.singlProduct.value.data!.id,
                          "qty": productController.a.value,
                          "price":
                              productController.singlProduct.value.data!.price,
                        };
                        await cartContoller.addToCart(data, token);
                        if (cartContoller.carts.value.data?.success == true) {
                          Get.snackbar('Sucess',
                              '${cartContoller.carts.value.data!.message}');
                              await  cartContoller.getToCart(token);
                        } else {
                          Get.snackbar("Error", "something went wrong");
                        }
                      }
                    },
                    icon: const Icon(Icons.add_shopping_cart),
                    label: const Text("Add to cart"))
              ],
            )
          ],
        );
      }
    });
  }
}
