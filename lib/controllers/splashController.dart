import 'dart:async';
import 'package:get/get.dart';
import 'package:to_do_app/controllers/noteController.dart';
import 'package:to_do_app/screens/HomePage.dart';
import 'package:to_do_app/utils/sharedPref.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    NoteController noteController = Get.put(NoteController());
    navigateToHome();
  }

  navigateToHome() async {
    await Future.delayed(Duration(seconds: 3), () {});
    NoteController noteController = Get.find<NoteController>();
    // DB.instance.key.value = 'notes';
    noteController.isLoading.value = true;
    noteController.notes.addAll(await DB.instance.future);
    noteController.isLoading.value = false;

    Get.offAll(() => HomePage());
  }
}
