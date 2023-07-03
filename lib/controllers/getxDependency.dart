import 'package:get/get.dart';
import 'package:to_do_app/controllers/dateController.dart';
import 'package:to_do_app/controllers/noteController.dart';
import 'package:to_do_app/controllers/splashController.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NoteController());
    Get.lazyPut(() => DateController());
    Get.lazyPut<SplashScreenController>(() => SplashScreenController());
  }
}
