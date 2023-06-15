import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomTimePicker extends StatelessWidget {
  var boxTextString;

  CustomTimePicker({super.key, required this.boxTextString});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return TextButton(
      style: TextButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
      ),
      onPressed: () {
        //time picker popup
      },
      child: Container(
          padding: const EdgeInsets.all(10),
          alignment: Alignment.centerLeft,
          height: 45,
          width: (width - 60) / 2,
          decoration: BoxDecoration(
            border: Border.all(
                color: Colors.grey, width: 1, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          // Task Note Here
          child: Text(
            boxTextString,
            style:
                const TextStyle(fontFamily: 'Euclid Regular', color: Colors.black54),
          )
          // HERE
          ),
    );
  }
}
