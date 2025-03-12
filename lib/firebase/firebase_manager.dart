import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/models/eventmodel.dart';
import 'package:todo_app/models/usermodel.dart';

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

  static getUserCollection() {
    return FirebaseFirestore.instance
        .collection("Users")
        .withConverter<UserModel>(fromFirestore: (snapshot, options) {
      return UserModel.fromJson(snapshot.data()!);
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

  static createUser(String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
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
