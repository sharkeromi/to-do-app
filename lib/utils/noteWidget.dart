import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        border:
            Border.all(color: Colors.grey, width: 1, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(10),
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Title Text",
            style: TextStyle(fontFamily: 'Euclid'),
          ),
          Text(
            "Lorem Ipsum dolor sit amet, consectetur elit. Risus est senectus est",
            style: TextStyle(fontFamily: 'Euclid Regular'),
          )
        ],
      ),
    );
  }
}
