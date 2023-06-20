import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/controllers/getxDependency.dart';
import 'package:to_do_app/screens/splashScreen.dart';

void main() {
  //SharedPreferences.setMockInitialValues({});
  //InitialBinding().dependencies();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 0, 123, 236)),
        useMaterial3: true,
      ),
      initialBinding: InitialBinding(),
      //home: TestScreen()
      home: SplashScreen(),
    );
  }
}
