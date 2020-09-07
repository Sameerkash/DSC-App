import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsckssem/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sembast/sembast.dart';

import '../models/event.dart';
import 'database.dart';

class AppRepository {
  /// Firestore instance
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  /// Firebase Auth instance
  FirebaseAuth auth = FirebaseAuth.instance;

  /// Smebase Databse Instance
  final Future<Database> _db = AppDatabase.instance.database;

  // Store
  final _store = stringMapStoreFactory.store('common_store');

  /// Keys
  static const USERKEY = 'userkey';

  /// Set user to local databse and Firestore collection
  Future<bool> setUser({String uid, User firebaseUser}) async {
    try {
      final result = await firestore.collection('users').doc(uid).get();
      if (result.exists) {
        final res = await _store
            .record(USERKEY)
            .put(await _db, result.data(), merge: true);
        print("write1 $res ");
        return true;
      } else {
        final user = AppUser(
            uid: uid,
            email: firebaseUser.email,
            userName: firebaseUser.displayName,
            phone: firebaseUser.phoneNumber);

        await firestore.collection('users').doc(uid).set(user.toJson());

        final res = await _store
            .record(USERKEY)
            .put(await _db, result.data(), merge: true);
        print("write2 $res ");

        return true;
      }
    } catch (e) {
      print("$e");
      return false;
    }
  }

  /// Get the current Logged In user
  Future<AppUser> getLoggedInUser() async {
    try {
      final user = await _store.record(USERKEY).get(await _db);
      print(user);
      final appuser = AppUser.fromJson(user);
      return appuser;
    } catch (e) {
      print(e);
    }
  }

  /// Sign out of the App
  Future<void> signOut() async {
    await _store.record(USERKEY).delete(await _db);
    await GoogleSignIn().signOut();
    await auth.signOut();
  }

  /// Sign In with Google Auth
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  /// Fetch the List of [Event]s from events collection
  Future<List<Event>> getEvents() async {
    try {
      List<Event> events = [];
      final result = await firestore.collection('events').get();

      result.docs.forEach((doc) {
        Event eve = Event.fromJson(doc.data());
        events.add(eve);
      });
      return events;
    } catch (e) {
      return [];
    }
  }
}
