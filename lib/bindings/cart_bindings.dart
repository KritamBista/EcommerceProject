import 'package:apk/controller/cart_controller.dart';
import 'package:apk/controller/customer_controller.dart';
import 'package:get/get.dart';

class CartBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(CartController());
    Get.put(CustomerController());
  }

}