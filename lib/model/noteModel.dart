class Note {
  String? id;
  String? title;
  String? notedTask;
  String? startDate;
  String? tempStartDate;
  String? endDate;
  String? tempEndDate;
  String? startTime;
  int? tempStartHour;
  int? tempStartMin; 
  String? endTime;
  int? tempEndHour;
  int? tempEndMin;

  Note({
    this.id,
    this.title,
    this.notedTask,
    this.startDate,
    this.tempStartDate,
    this.endDate,
    this.tempEndDate,
    this.endTime,
    this.tempStartHour,
    this.tempStartMin,
    this.startTime,
    this.tempEndHour,
    this.tempEndMin
  });

  factory Note.ofJson(Map<String, dynamic> map) {
    return Note(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      notedTask: map['notedTask'] ?? '',
      startDate: map['startDate'] ?? '',
      tempStartDate: map['tempStartDate'] ?? '',
      endDate: map['endDate'] ?? '',
      tempEndDate: map['tempEndDate'] ?? '',
      startTime: map['startTime'] ?? '',
      tempStartHour: map['tempStartHour'] ?? 0,
      tempStartMin: map['tempStartMin'] ?? 0,
      endTime: map['endTime'] ?? '',
      tempEndHour: map['tempEndHour'] ?? 0,
      tempEndMin: map['tempEndMin'] ?? 0
    );
  }

  Map<String, dynamic> get json => {
        'id': id,
        'title': title,
        'notedTask': notedTask,
        'startDate': startDate,
        'tempStartDate': tempStartDate,
        'endDate': endDate,
        'tempEndDate' : tempEndDate,
        'startTime': startTime,
        'tempStartHour': tempStartHour,
        'tempStartMin': tempStartMin,
        'endTime': endTime,
        'tempEndHour': tempEndHour,
        'tempEndMin' : tempEndMin
      };
}
