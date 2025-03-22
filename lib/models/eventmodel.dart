class EventModel {
  String id;
  String title;
  String description;
  String category;
  int date;
  String time;
  String location;
  bool isDone;
  String userId;

  EventModel(
      {this.id = "",
      required this.title,
      required this.category,
      required this.date,
      required this.description,
      required this.time,
      this.isDone = false,
      this.location = "",
      required this.userId});

  static fromJson(Map<String, dynamic> json) {
    return EventModel(
        id: json['id'],
        title: json['title'],
        category: json['category'],
        date: json['date'],
        description: json['description'],
        location: json['location'],
        time: json['time'],
        isDone: json['isDone'],
        userId: json['userId']);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "category": category,
      "description": description,
      "date": date,
      "time": time,
      "isDone": isDone,
      "location": location,
      "userId": userId
    };
  }
}
