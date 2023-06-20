import 'package:flutter/material.dart';

class NoteWidget extends StatelessWidget {
  var title;

  var notedTask;

  var id;

  var startDate;
  var endDate;
  var startTime;
  var endTime;

  // final Note noteID;

  NoteWidget(
      {Key? key,
      required this.id,
      required this.title,
      required this.notedTask,
      required this.startDate,
      required this.endDate,
      required this.startTime,
      required this.endTime})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // print(id);
    return Container(
      height: 110,
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
            style: const TextStyle(fontFamily: 'Euclid', fontSize: 20),
          ),
          Text(
            notedTask,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontFamily: 'Euclid Regular', fontSize: 16),
          ),
          Text(
              "${startDate}" +
                  " at " +
                  "${startTime}" +
                  " - " +
                  "${endDate}" +
                  " at " +
                  "${endTime}",
              overflow: TextOverflow.clip,
              style:
                  const TextStyle(fontFamily: 'Euclid Regular', fontSize: 14))
        ],
      ),
    );
  }
}
