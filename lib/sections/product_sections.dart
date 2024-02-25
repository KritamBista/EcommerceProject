import 'package:apk/controller/product_controller.dart';
import 'package:apk/utils/string.dart';
import 'package:apk/views/product_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductSections extends StatelessWidget {
  ProductSections({super.key});
  var productsController = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (productsController.isLoading.value == true) {
        return const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                // child: CircularProgressIndicator(),
                ),
          ],
        );
      } else {
        return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: productsController.productBasket.value.data.length,
            itemBuilder: (context, index) {
              var products = productsController.productBasket.value.data[index];
              return InkWell(
                onTap: () {
                  Get.toNamed(AppRoute.productDetailRoute);
                  productsController.getProductsDetail(
                      productsController.productBasket.value.data[index].id);
                },
                child: Card(
                    child: Column(
                  children: [
                    Expanded(
                        child: Image.network(
                      "${products.image}",
                      fit: BoxFit.contain,
                    )),
                    Text("${products.name}")
                  ],
                )),
              );
            });
      }
    });
  }
}
