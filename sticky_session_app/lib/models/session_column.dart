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
