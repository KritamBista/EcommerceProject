import 'package:apk/controller/category_controller.dart';
import 'package:apk/controller/product_controller.dart';
import 'package:get/get.dart';

class BindingController extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(ProductController());
    Get.put(CategoryController());
  }
}
