class Note {
  String? _id;
  String? title;
  String? notedTask;
  DateTime? startDate;
  DateTime? endDate;
  String? startTime;
  String? endTime;

  Note(
      {this.title,
      this.notedTask,
      this.startDate,
      this.endDate,
      this.endTime,
      this.startTime,
      String? id}) {
    id = id ?? generateId;
  }

  factory Note.ofJson(Map<String, dynamic> map) {
    if (map.isEmpty) {
      return Note(
        id: '',
        title: '',
        notedTask: '',
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        startTime: '',
        endTime: '',
      );
    }
    return Note(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      notedTask: map['notedTask'] ?? '',
      startDate: DateTime.tryParse(['startDate'].toString()) ?? DateTime.now(),
      endDate: DateTime.tryParse(map['endDate'].toString()) ?? DateTime.now(),
      startTime: map['startTime'] ?? '',
      endTime: map['endTime'] ?? '',
    );
  }

  Map<String, dynamic> get json => {
        'id': id,
        'title': title,
        'notedTask': notedTask,
        'startDate': startDate.toString(),
        'endDate': endDate.toString(),
        'startTime': startTime,
        'endTime': endTime,
      };

  String get id => _id ?? generateId;

  String get generateId => DateTime.now().microsecondsSinceEpoch.toString();
}
