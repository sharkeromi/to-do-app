import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/screens/addToDoScreen.dart';
import 'package:to_do_app/utils/customButton.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                    text: "Add ToDo",
                    height: 45,
                    width: 120,
                    navigation: () {
                      Get.to(() => const AddToDo());
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
