import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
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

  static Future<void> addUser(UserModel user) {
    var collection = getUserCollection();
    var docRef = collection.doc(user.id);
    return docRef.set(user);
  }

  static Stream<QuerySnapshot<EventModel>> getEvents(String categoryName) {
    var collection = getEventCollection();
    if (categoryName == "All") {
      return collection
          .orderBy("date")
          .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .snapshots();
    } else {
      return collection
          .orderBy("date")
          .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .where("category", isEqualTo: categoryName)
          .snapshots();
    }
  }

  static Stream<QuerySnapshot<EventModel>> getTaskWithId(String id) {
    var collection = getEventCollection();
    return collection.where("id", isEqualTo: id).snapshots();
  }

  static Stream<QuerySnapshot<EventModel>> getFavouriteEvents(String title) {
    var collection = getEventCollection();
    if (title == null || title.isEmpty) {
      return collection
          .orderBy("date")
          .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .where("isDone", isEqualTo: true)
          .snapshots();
    } else {
      return collection
          .orderBy("date")
          .where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .where("isDone", isEqualTo: true)
          .where("title", isGreaterThanOrEqualTo: title)
          .where("title", isLessThan: title + '\uf8ff')
          .snapshots();
    }
  }

  static createUser(String email, String password, String userName,
      Function onSuccess, Function onError, Function onLoading) async {
    try {
      onLoading();
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserModel user = UserModel(
          id: credential.user!.uid,
          userName: userName,
          email: email,
          createdAt: DateTime.now().millisecondsSinceEpoch);
      await addUser(user);
      credential.user!.sendEmailVerification();
      onSuccess();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        onError(e.message);
      } else if (e.code == 'email-already-in-use') {
        onError(e.message);
      }
    } catch (e) {
      onError("SomeThing went wrong");
      print(e);
    }
  }

  static login(String email, String password, Function onSuccess,
      Function onError, Function onloading) async {
    try {
      onloading();
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (credential.user!.emailVerified) {
        onSuccess();
      } else {
        onError("Email is not verified, Please check your mail and verify");
      }
    } on FirebaseAuthException catch (e) {
      onError("Email or password is not valid");
    }
  }

  static Future<UserCredential> signInWithGoogle() async {
    // Step 1: Sign out to ensure account selection
    GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut(); // This ensures the account picker shows up

    // Step 2: Initiate sign-in process
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser == null) {
      throw Exception("Google Sign-In canceled");
    }

    // Step 3: Get authentication credentials
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Step 4: Sign in to Firebase with Google credentials
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  static Future<UserModel?> readUserData(String id) async {
    var collection = getUserCollection();
    DocumentSnapshot<UserModel> snapshot = await collection.doc(id).get();
    return snapshot.data();
  }

  static Future<void> deleteEvent(String id) {
    var collection = getEventCollection();
    return collection.doc(id).delete();
  }

  static Future<void> updateEvent(EventModel event) {
    var collection = getEventCollection();

    return collection.doc(event.id).update(event.toJson());
  }

  static Future<void> forgetPassword(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  static Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
