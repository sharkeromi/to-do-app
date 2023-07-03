import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/controllers/noteController.dart';

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

  NoteController noteController = Get.find();
  @override
  Widget build(BuildContext context) {
    // print(id);
    return Container(
      //height: 110,
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.grey.shade400, width: 1, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      padding: const EdgeInsets.only(top: 5, left: 10, right: 8, bottom: 10),
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${title}",
                  style: const TextStyle(fontFamily: 'Euclid', fontSize: 20),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "${notedTask}",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontFamily: 'Euclid Regular', fontSize: 16),
                ),
                const SizedBox(
                  height: 5,
                ),
                dateTimeTextFromat()
              ],
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
            ),
            onPressed: () async {
              await noteController.delete(id);
              await noteController.loadData();
            },
            child: Image.asset('assets/delete.png'),
          ),
          // IconButton(
          //     padding: EdgeInsets.zero,
          //     iconSize: 5,
          //     onPressed: () async {
          //       await noteController.delete(id);
          //       await noteController.loadData();
          //     },
          //       icon: Image.asset('assets/delete.png'))
        ],
      ),
    );
  }

  dateTimeTextFromat() {
    if ((startDate == endDate || endDate == "") && startTime == endTime) {
      return Text(
        "${startDate}" + " at " + "${startTime}",
        overflow: TextOverflow.clip,
        style: const TextStyle(fontFamily: 'Euclid Regular', fontSize: 14),
      );
    } else if ((startDate == endDate || endDate == "") && endTime == '') {
      return Text(
        "${startDate} at ${startTime}",
        overflow: TextOverflow.clip,
        style: const TextStyle(fontFamily: 'Euclid Regular', fontSize: 14),
      );
    } else if ((startDate == endDate || endDate == "") &&
        startTime != endTime) {
      return Text(
        "${startDate} from ${startTime} - ${endTime}",
        overflow: TextOverflow.clip,
        style: const TextStyle(fontFamily: 'Euclid Regular', fontSize: 14),
      );
    } else if (startDate != endDate && endTime != '') {
      return Text(
        "${startDate} from ${startTime} - ${endDate}",
        overflow: TextOverflow.clip,
        style: const TextStyle(fontFamily: 'Euclid Regular', fontSize: 14),
      );
    } else if (startDate != endDate && endTime == '') {
      return Text(
        "${startDate} from ${startTime} - ${endDate}",
        overflow: TextOverflow.clip,
        style: const TextStyle(fontFamily: 'Euclid Regular', fontSize: 14),
      );
    } else {
      return Text(
        "${startDate} at ${startTime} - ${endDate} at ${endTime}",
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontFamily: 'Euclid Regular', fontSize: 14),
      );
    }
  }
}
