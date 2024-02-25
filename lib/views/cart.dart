import 'package:apk/controller/cart_controller.dart';
import 'package:apk/utils/appsize.dart';
import 'package:apk/utils/string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  CartView({super.key});
  var cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        child: Padding(
          padding: EdgeInsets.all(AppSize.p8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total :${cartController.total}"),
              ElevatedButton.icon(onPressed: (){
                Get.toNamed(AppRoute.checkOutRoute);
              }, icon: const Icon(Icons.arrow_back), label:  const Text("Check Out")),
              
            ],
          ),
        ),
      ),
        appBar: AppBar(
          title: const Text("CheckOut Page"),
        ),
        body: Obx(() {
          if (cartController.isLoading.value == true) {
           return const Text("Is Loading");
          } else {
            return ListView.builder(
              itemCount: cartController.cartItem.value.data.length,
              itemBuilder: (context, index) {
              
              var item = cartController.cartItem.value.data[index];
              return ListTile(
                title: Text("${item.product}"),
                leading: Image.network("${item.image}"),
                subtitle: Text("(${item.qty}) X ${item.price}: ${item.amount}"),
                trailing: const InkWell(
                  
                  child: Icon(Icons.delete)),
              );
            });
          }
        }));
  }
}
