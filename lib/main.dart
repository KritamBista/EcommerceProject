import 'package:apk/bindings/auth_bindings.dart';
import 'package:apk/bindings/bindings_controller.dart';
import 'package:apk/bindings/cart_bindings.dart';
import 'package:apk/bindings/order_bindings.dart';
import 'package:apk/controller/auth_controller.dart';
import 'package:apk/utils/string.dart';
import 'package:apk/views/cart.dart';
import 'package:apk/views/checkout.dart';
import 'package:apk/views/home.dart';
import 'package:apk/views/login.dart';
import 'package:apk/views/product_details.dart';
import 'package:apk/views/spash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      child: GetMaterialApp(
          title: 'eCommerce',
          theme: ThemeData(
            // This is the theme of your application.
            //
            // TRY THIS: Try running your application with "flutter run". You'll see
            // the application has a purple toolbar. Then, without quitting the app,
            // try changing the seedColor in the colorScheme below to Colors.green
            // and then invoke "hot reload" (save your changes or press the "hot
            // reload" button in a Flutter-supported IDE, or press "r" if you used
            // the command line to start the app).
            //
            // Notice that the counter didn't reset back to zero; the application
            // state is not lost during the reload. To reset the state, use hot
            // restart instead.
            //
            // This works for code too, not just values: Most code changes can be
            // tested with just a hot reload.
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          // initialBinding: BindingController(),
          initialRoute: AppRoute.splashRoute,
          getPages: [
            GetPage(name: AppRoute.splashRoute, page: () => SplashView()),
            GetPage(
                name: AppRoute.loginRoute,
                page: () => const LoginView(),
                binding: AuthBindings()),
            GetPage(
                name: AppRoute.homeRoute,
                page: () => HomeView(),
                bindings: [BindingController(), AuthBindings()]),
            GetPage(
              name: AppRoute.productDetailRoute,
              page: () => const ProductView(),
            ),
            GetPage(name: AppRoute.cartRoute, page: () => CartView()),
            GetPage(
              name: AppRoute.productDetailRoute,
              page: () => const ProductView(),
            ),
            GetPage(
                binding: OrderBidings(),
                name: AppRoute.checkOutRoute,
                page: () => CheckOutView()),
          ],
          initialBinding: CartBindings(),
          home: SplashView()),
    );
  }
}
