// To parse this JSON data, do
//
//     final sticky = stickyFromJson(jsonString);

import 'dart:convert';

List<Sticky> stickyFromJson(String str) => List<Sticky>.from(json.decode(str).map((x) => Sticky.fromJson(x)));

String stickyToJson(List<Sticky> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Sticky {
  Sticky({
    required this.id,
    required this.content,
    required this.columnName,
    required this.userName,
    required this.sessionId,
  });

  String id;
  String content;
  String columnName;
  String userName;
  String sessionId;

  factory Sticky.fromJson(Map<String, dynamic> json) => Sticky(
    id: json["id"],
    content: json["content"],
    columnName: json["columnName"],
    userName: json["userName"],
    sessionId: json["sessionId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "content": content,
    "columnName": columnName,
    "userName": userName,
    "sessionId": sessionId,
  };
}
