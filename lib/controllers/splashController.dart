import 'package:get/get.dart';
import 'package:to_do_app/controllers/noteController.dart';
import 'package:to_do_app/controllers/sp_class.dart';
import 'package:to_do_app/screens/HomePage.dart';

class SplashScreenController extends GetxController {
  final SP sp = SP();

  @override
  void onInit() async {
    await sp.getList();
    await navigateToHome();
    super.onInit();
  }

  navigateToHome() async {
    await Future.delayed(const Duration(seconds: 5), () {});
    NoteController noteController = Get.find<NoteController>();
    noteController.isLoading.value = false;
    Get.offAll(() => HomePage());
  }
}
