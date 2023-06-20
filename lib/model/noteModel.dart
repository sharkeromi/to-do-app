class Note {
  String? id;
  String? title;
  String? notedTask;
  String? startDate;
  String? endDate;
  String? startTime;
  String? endTime;

  Note({
    String? id,
    this.title,
    this.notedTask,
    this.startDate,
    this.endDate,
    this.endTime,
    this.startTime,
  }) {
    //_id = id ?? generateId;
  }

  factory Note.ofJson(Map<String, dynamic> map) {
    // if (map.isEmpty) {
    //   print(2);
    //   return Note(
    //     id: '',
    //     title: '',
    //     notedTask: '',
    //     startDate: DateTime.now(),
    //     endDate: DateTime.now(),
    //     startTime: '',
    //     endTime: '',
    //   );
    // }
    // print(2);

    return Note(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      notedTask: map['notedTask'] ?? '',
      startDate: map['startDate'] ?? '',
      endDate: map['endDate'] ?? '',
      startTime: map['startTime'] ?? '',
      endTime: map['endTime'] ?? '',
    );
  }

  Map<String, dynamic> get json => {
        'id': id,
        'title': title,
        'notedTask': notedTask,
        'startDate': startDate,
        'endDate': endDate,
        'startTime': startTime,
        'endTime': endTime,
      };

  // String get id => _id ?? generateId;

  // String get generateId => DateTime.now().microsecondsSinceEpoch.toString();
}
