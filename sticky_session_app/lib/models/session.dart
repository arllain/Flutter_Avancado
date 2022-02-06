import 'dart:convert';

List<Session> sessionFromJson(String str) => List<Session>.from(json.decode(str).map((x) => Session.fromJson(x)));

String sessionToJson(List<Session> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Session {
  Session({
    required this.id,
    required this.meetingId,
    required this.name,
    required this.description,
    required this.columns,
    required this.highlight,
    required this.answer,
  });

  String id;
  String meetingId;
  String name;
  String description;
  List<SessionColumn> columns;
  String highlight;
  int answer;

  factory Session.fromJson(Map<String, dynamic> json) => Session(
    id: json["id"],
    meetingId: json["meetingId"],
    name: json["name"],
    description: json["description"],
    columns: List<SessionColumn>.from(json["columns"].map((x) => SessionColumn.fromJson(x))),
    highlight: json["highlight"],
    answer: json["answer"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "meetingId": meetingId,
    "name": name,
    "description": description,
    "columns": List<dynamic>.from(columns.map((x) => x.toJson())),
    "highlight": highlight,
    "answer": answer,
  };
}

class SessionColumn {
  SessionColumn({
    required this.name,
    required this.color,
  });

  String name;
  String color;

  factory SessionColumn.fromJson(Map<String, dynamic> json) => SessionColumn(
    name: json["name"],
    color: json["color"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "color": color,
  };
}
