import 'dart:convert';

List<Meeting> meetingFromJson(String str) => List<Meeting>.from(json.decode(str).map((x) => Meeting.fromJson(x)));

String meetingToJson(List<Meeting> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Meeting {
  Meeting({
    required this.id,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.local,
    required this.sessions,
    required this.people,
  });

  String id;
  String title;
  String description;
  String startDate;
  String endDate;
  String local;
  int sessions;
  int people;

  factory Meeting.fromJson(Map<String, dynamic> json) => Meeting(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    startDate: json["startDate"],
    endDate: json["endDate"],
    local: json["local"],
    sessions: json["sessions"],
    people: json["people"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "startDate": startDate,
    "endDate": endDate,
    "local": local,
    "sessions": sessions,
    "people": people,
  };
}
