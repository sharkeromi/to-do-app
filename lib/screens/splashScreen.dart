import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/controllers/splashController.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  SplashScreenController splashScreenController =
      Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset("assets/splashScreen.gif")),
    );
  }
}
