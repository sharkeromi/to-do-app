import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:to_do_app/utils/customButton.dart';
import 'package:to_do_app/utils/customTextField.dart';
import 'package:to_do_app/utils/noteWidget.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child:SizedBox(),
        ),
      ),
    );
  }
}
