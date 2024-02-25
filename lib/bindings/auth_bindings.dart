import 'package:apk/controller/auth_controller.dart';
import 'package:get/get.dart';

class AuthBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(AuthController());
  }

}