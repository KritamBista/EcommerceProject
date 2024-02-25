import 'package:apk/controller/cart_controller.dart';
import 'package:apk/controller/customer_controller.dart';
import 'package:apk/sections/category_section.dart';
import 'package:apk/sections/product_sections.dart';
import 'package:apk/utils/appsize.dart';
import 'package:apk/utils/string.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  var cartController = Get.find<CartController>();
  var customerController = Get.find<CustomerController>();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              const ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
              ),
              const ListTile(
                leading: Icon(Icons.info),
                title: Text("About Us"),
              ),
              const ListTile(
                leading: Icon(Icons.history),
                title: Text("Purchase History"),
              ),
              const Spacer(),
              ListTile(
                leading: const Icon(Icons.arrow_back),
                title: const Text("LogOut"),
                onTap: () {
                  Get.defaultDialog(
                      actions: [
                        ElevatedButton(
                            onPressed: () async {
                              SharedPreferences p =
                                  await SharedPreferences.getInstance();
                              p.remove('token');
                              
                              Get.offAllNamed(AppRoute.loginRoute);
                              
                            },
                            child: const Text("Yes")),
                        ElevatedButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: const Text("No"))
                      ],
                      title: 'Logout',
                      content: const Text("Are you sure you want to log out?"));
                },
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text("StartUp"),
          actions: [
            Obx(() => InkWell(
                  onTap: () {
                    Get.toNamed(AppRoute.cartRoute);
                  },
                  child: Padding(
                    padding: EdgeInsets.all(AppSize.p16),
                    child: badges.Badge(
                      badgeContent:
                          Text('${cartController.cartItem.value.data.length}'),
                      child:const Icon(Icons.shopping_cart),
                    ),
                  ),
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text("welcome ${customerController.customerModel.value.data?.name}"),
              CategoriesSection(),
              ProductSections(),
            ],
          ),
        ),
      ),
    );
  }
}
