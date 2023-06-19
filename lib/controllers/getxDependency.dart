import 'package:get/get.dart';
import 'package:to_do_app/controllers/noteController.dart';
import 'package:to_do_app/controllers/splashController.dart';
import 'package:to_do_app/utils/sharedPref.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NoteController());
    Get.lazyPut(() => DB());
    Get.lazyPut<SplashScreenController>(() => SplashScreenController());
  }
}
