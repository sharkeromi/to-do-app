import 'package:flutter/material.dart';

class NoteWidget extends StatelessWidget {
  var title;

  var notedTask;

  var id;

  // final Note noteID;

  NoteWidget(
      {Key? key,
      required this.id,
      required this.title,
      required this.notedTask})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(id);
    return Container(
      height: 120,
      decoration: BoxDecoration(
        border:
            Border.all(color: Colors.grey, width: 1, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      padding: const EdgeInsets.only(left: 10, right: 10),
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontFamily: 'Euclid'),
          ),
          Text(
            notedTask,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontFamily: 'Euclid Regular'),
          ),
          Text("27 February at 3.00 AM - 28 February at 3.00 AM ",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontFamily: 'Euclid Regular'))
        ],
      ),
    );
  }
}
