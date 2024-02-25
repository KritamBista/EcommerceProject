import 'package:apk/controller/cart_controller.dart';
import 'package:apk/controller/customer_controller.dart';
import 'package:apk/controller/order_controller.dart';
import 'package:apk/utils/string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckOutView extends StatelessWidget {
  CheckOutView({super.key});
  var customerController = Get.find<CustomerController>();
  var cartController = Get.find<CartController>();
  var orderController = Get.find<OrderController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Obx(() {
          if (customerController.isLoading.value == true) {
            return const Center(child: CircularProgressIndicator());
          } else {
            print(customerController.isLoading.value);

            return Column(
              children: [
                SizedBox(
                  width: Get.size.width,
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Personal Details",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                            " Name:${customerController.customerModel.value.data?.name}"),
                        Text(
                            " Email:${customerController.customerModel.value.data?.email}"),
                        ElevatedButton(
                            onPressed: () async {
                              SharedPreferences p =
                                  await SharedPreferences.getInstance();
                              var token = p.getString("token");
                              Map data = {
                                "total": cartController.total.value,
                                // "orderLines" : [
                                //     {
                                //         "product_id" : 1,
                                //         "qty" : 1,
                                //         "amount" : 250
                                //     },
                                //     {
                                //         "product_id" : 2,
                                //         "qty" : 2,
                                //         "amount" : 100
                                //      }
                                // ]
                                "orderLines":
                                    cartController.cartItem.value.data.map((e) {
                                  return {
                                    "product_id": e.productId,
                                    "qty": e.qty,
                                    "amount": e.amount
                                  };
                                }).toList(),
                              };
                              await orderController.postOrder(data, token!);
                              if (orderController.order.value.data?.success ==
                                  true) {
                                Get.defaultDialog(
                                    title: "Success",
                                    content: Text(
                                        "${orderController.order.value.data?.message}"),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            cartController.getToCart(token);
                                            Get.back();
                                            Get.toNamed(AppRoute.homeRoute);
                                          },
                                          child: const Text("OK"))
                                    ]);
                              }
                            },
                            child: const Text("Place Order"))
                      ],
                    ),
                  ),
                )
              ],
            );
          }
        }));
  }
}
