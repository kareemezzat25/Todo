import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/models/eventmodel.dart';

class FirebaseManager {
  static CollectionReference<EventModel> getEventCollection() {
    return FirebaseFirestore.instance
        .collection("Events")
        .withConverter<EventModel>(fromFirestore: (snapshot, options) {
      return EventModel.fromJson(snapshot.data()!);
    }, toFirestore: (value, options) {
      return value.toJson();
    });
  }

  static void addEvent(EventModel event) {
    var collection = getEventCollection();
    var docRef = collection.doc();
    event.id = docRef.id;

    docRef.set(event);
  }
}
