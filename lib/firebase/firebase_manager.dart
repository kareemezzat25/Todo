import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/models/eventmodel.dart';

class FirebaseManager {
  static void addEvent() {
    FirebaseFirestore.instance.collection("Events").withConverter<EventModel>(
        fromFirestore: (snapshot, options) =>
            EventModel.fromJson(snapshot.data()!),
        toFirestore: (value, options) {
          return value.toJson();
        });
  }
}
