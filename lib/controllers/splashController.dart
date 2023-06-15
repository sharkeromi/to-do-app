import 'dart:async';
import 'package:get/get.dart';
import 'package:to_do_app/screens/HomePage.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    navigateToHome();
  }

  navigateToHome() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Get.offAll(() => const HomePage());
  }
}
