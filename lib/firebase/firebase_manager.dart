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

  static Future<void> addEvent(EventModel event) {
    var collection = getEventCollection();
    var docRef = collection.doc();
    event.id = docRef.id;

    return docRef.set(event);
  }

  static Stream<QuerySnapshot<EventModel>> getEvents() {
    var collection = getEventCollection();
    return collection.orderBy("date").snapshots();
  }

  static Future<void> deleteEvent(String id) {
    var collection = getEventCollection();
    return collection.doc(id).delete();
  }

  static Future<void> updateEvent(EventModel event) {
    var collection = getEventCollection();

    return collection.doc(event.id).update(event.toJson());
  }
}
