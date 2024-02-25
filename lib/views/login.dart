import 'package:apk/controller/auth_controller.dart';
import 'package:apk/utils/appsize.dart';
import 'package:apk/utils/string.dart';
import 'package:apk/utils/text_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var isVisible = false;
  @override
  Widget build(BuildContext context) {
    var authController = Get.find<AuthController>();

    GlobalKey<FormState> fromkey = GlobalKey<FormState>();
    return Scaffold(
      body: LoaderOverlay(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(AppSize.p8),
            child: Form(
              key: fromkey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: AppController.email,
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return 'Email is required';
                        }
                        return null;
                      }),
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          labelText: "Email", prefixIcon: Icon(Icons.email)),
                    ),
                    TextFormField(
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return 'Password is required';
                        }
                        return null;
                      }),
                      controller: AppController.password,
                      decoration: InputDecoration(
                          labelText: "Password",
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  isVisible = !isVisible;
                                });
                              },
                              child: isVisible
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility))),
                      obscureText: isVisible ? true : false,
                    ),
                    ElevatedButton(
                        child: const Text("Login"),
                        onPressed: () async {
                          if (fromkey.currentState!.validate()) {
                            // Get.offNamed(AppRoute.homeRoute);

                            Map data = {
                              "email": AppController.email.text,
                              "password": AppController.password.text
                            };

                        //  context.loaderOverlay.show();
                            await authController.login(data);
                            // ignore: use_build_context_synchronously
                            // context.loaderOverlay.hide();
                            print(
                                "${authController.loginBasket.value.data?.token}");
                            if (authController.loginBasket.value.data?.token !=
                                null) {
                              SharedPreferences preferences =
                                  await SharedPreferences.getInstance();
                              preferences.setString("token",
                                  "${authController.loginBasket.value.data?.token}");
                              Get.offNamed(AppRoute.homeRoute);
                            
                            } else {
                              Get.defaultDialog(
                                  cancel: ElevatedButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: const Text("cancel")),
                                  content: const Text("Error Ocuurred "),
                                  title: "Invalid username");
                            }
                          }
                        }),
                    OutlinedButton(
                        onPressed: () {
                          Get.offNamed(AppRoute.homeRoute);
                        },
                        child: const Text("Skip"))
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
