class EventModel {
  String id;
  String title;
  String description;
  String category;
  int date;
  bool isDone;

  EventModel(
      {this.id = "",
      required this.title,
      required this.category,
      required this.date,
      required this.description,
      this.isDone = false});

  static fromJson(Map<String, dynamic> json) {
    return EventModel(
        id: json['id'],
        title: json['title'],
        category: json['category'],
        date: json['date'],
        description: json['description'],
        isDone: json['isDone']);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "category": category,
      "description": description,
      "date": date,
      "isDone": isDone
    };
  }
}
