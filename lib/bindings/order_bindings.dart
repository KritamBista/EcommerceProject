import 'package:apk/controller/order_controller.dart';
import 'package:get/get.dart';

class OrderBidings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(OrderController());
  }
}