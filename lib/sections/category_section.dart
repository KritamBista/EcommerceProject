import 'package:apk/controller/category_controller.dart';
import 'package:apk/controller/product_controller.dart';
import 'package:apk/utils/appsize.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesSection extends StatelessWidget {
  CategoriesSection({super.key});
  var categoryController = Get.find<CategoryController>();
  var productController = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          InkWell(
              onTap: () {
                productController.getProducts();
              },
              child: Chip(label: const Text("All"))),
          SizedBox(
            height: 60,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoryController.categoryBasket.value.data.length,
                itemBuilder: (context, index) {
                  var category =
                      categoryController.categoryBasket.value.data[index];
                  return Padding(
                    padding: EdgeInsets.all(AppSize.p8),
                    child: InkWell(
                      onTap: () {
                        productController.getProductsByCategory(category.id);
                      },
                      child: Chip(
                          avatar: Image.network("${category.image}"),
                          label: Text("${category.name}")),
                    ),
                  );
                }),
          ),
        ],
      );
    });
  }
}
