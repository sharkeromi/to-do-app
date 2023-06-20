import 'package:get/get.dart';
import 'package:to_do_app/controllers/noteController.dart';
import 'package:to_do_app/controllers/sp_class.dart';
import 'package:to_do_app/screens/HomePage.dart';
import 'package:to_do_app/utils/sharedPref.dart';

class SplashScreenController extends GetxController {
  final SP sp = SP();

  @override
  void onInit() async {
    await sp.remove();
    //NoteController noteController = Get.put(NoteController());
    await sp.getList();
    await navigateToHome();
    super.onInit();
  }

  navigateToHome() async {
    await Future.delayed(Duration(seconds: 3), () {});
   

    NoteController noteController = Get.find<NoteController>();
    // DB.instance.key.value = 'notes';
    //noteController.isLoading.value = true;
    //DB db = Get.find<DB>();

    //noteController.notes.addAll(await db.future);
    noteController.isLoading.value = false;

    Get.to(() => HomePage());
  }
}
