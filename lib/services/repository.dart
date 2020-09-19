import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsckssem/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sembast/sembast.dart';
import 'package:path/path.dart' as path;

import '../models/event.dart';
import 'database.dart';

class AppRepository {
  /// Firestore instance
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  /// Firebase Auth instance
  FirebaseAuth auth = FirebaseAuth.instance;

  /// Smebase Databse Instance
  final Future<Database> _db = AppDatabase.instance.database;

  /// Firebase Storage
  final firebaseStorage = FirebaseStorage.instance.ref();
  // Store
  final _store = stringMapStoreFactory.store('common_store');

  /// Keys
  static const USERKEY = 'userkey';

  /// Set user to local databse and Firestore collection
  Future<bool> setUser({String uid, User firebaseUser}) async {
    try {
      final result = await firestore.collection('users').doc(uid).get();
      if (result.exists) {
        /// Save to Local Storage
        await _store.record(USERKEY).put(await _db, result.data(), merge: true);

        return true;
      } else {
        final user = AppUser(
          uid: uid,
          email: firebaseUser.email,
          userName: firebaseUser.displayName,
          phone: firebaseUser.phoneNumber,
          imageUrl: firebaseUser.photoURL,
        );

        /// Save to firebase
        await firestore.collection('users').doc(uid).set(user.toJson());

        /// Save to local Storage
        await _store.record(USERKEY).put(await _db, user.toJson(), merge: true);

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
      return null;
    }
  }

  /// Sign out of the App
  Future<void> signOut() async {
    final res = await _store.record(USERKEY).delete(await _db);
    print(res);
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

  /// Create or Update [Event]
  Future<void> createEvent(
      {@required Event event, String imageUrl, File image, String uuid}) async {
    try {
      ///
      print("called");
      if (image != null) {
        var fileExtension = path.extension(image.path);
        final storageRefrence =
            firebaseStorage.child('events/$uuid$fileExtension');

        await storageRefrence.putFile(image).onComplete.catchError((err) {
          print(err);
          return;
        });

        String url = await storageRefrence.getDownloadURL();
        //
        final eve = event.copyWith(imageUrl: url);

        await firestore
            .collection('events')
            .doc(uuid)
            .set(eve.toJson(), SetOptions(merge: true));
      } else {
        final eve = event.copyWith(imageUrl: imageUrl);

        await firestore
            .collection('events')
            .doc(uuid)
            .set(eve.toJson(), SetOptions(merge: true));
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteEvent({@required String eid, String imageUrl}) async {
    try {
      final StorageReference storageReference =
          await FirebaseStorage.instance.getReferenceFromUrl(imageUrl);

      await storageReference.delete();

      await firestore.collection('events').doc(eid).delete();
    } catch (e) {
      print(e);
    }
  }

  /// Registers the user for a gievn Event
  ///
  /// Get a reference to the event collection
  /// add the user to the events/registrations
  /// Genertate QR code
  Future<void> resgiterEvent(
      {@required AppUser user, @required String eid, int attendees}) async {
    try {
      //
      await firestore
          .collection('events/$eid/registrations')
          .doc(user.uid)
          .set(user.toJson());

      await firestore
          .collection('events')
          .doc(eid)
          .set({"attendees": attendees}, SetOptions(merge: true));
    } catch (e) {}
  }

  Future<List<AppUser>> fetchEventregistrations({@required String eid}) async {
    try {
      //
      List<AppUser> registratns = [];
      final result =
          await firestore.collection('events/$eid/registrations').get();

      if (result.docs.isNotEmpty) {
        result.docs.forEach((u) {
          AppUser user = AppUser.fromJson(u.data());
          registratns.add(user);
        });
      }

      return registratns;
    } catch (e) {
      print(e);

      return [];
    }
  }

  Future<List<Event>> fecthMyEvents({String uid}) async {
    try {
      List<Event> myevents = [];
      final result = await firestore.collection('users/$uid/myevents').get();
      result.docs.forEach((e) {
        Event eve = Event.fromJson(e.data());
        myevents.add(eve);
      });

      return myevents;
    } catch (e) {
      return [];
    }
  }

  Future<bool> confirmRegistration(String eid, String uid) async {
    try {
      final DocumentReference user = firestore.collection('users').doc(uid);
      final DocumentReference event = firestore.collection('events').doc(eid);
      final DocumentReference userevent =
          firestore.collection('events/$eid/registrations').doc(uid);

      // bool success = true;

      final res = await firestore.runTransaction((transaction) async {
        final userSnapshot = await transaction.get(user);
        final eventSnapshot = await transaction.get(event);
        final userEvent = await transaction.get(userevent);

        if (!userSnapshot.exists ||
            !eventSnapshot.exists ||
            !userEvent.exists) {
          return false;
        }

        await firestore
            .collection('events/$eid/attendees')
            .doc(user.id)
            .set(userSnapshot.data());

        await firestore
            .collection('users/$uid/myevents')
            .doc(eid)
            .set(eventSnapshot.data());

        print('called');
        return true;
      });

      return res;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<AppUser>> serahcUser({String userName}) async {
    try {
      List<AppUser> users = [];

      final result = await firestore
          .collection('/users')
          .where('userName', isGreaterThanOrEqualTo: userName)
          .get();

      result.docs.forEach((doc) {
        AppUser u = AppUser.fromJson(doc.data());
        users.add(u);
      });

      return users;
    } catch (e) {
      return [];
    }
  }

  Future<void> deleteUser({String uid}) async {
    try {
      await firestore.collection('users').doc(uid).delete();
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateProfile({AppUser user}) async {
    try {
      await firestore.collection('users').doc(user.uid).update(user.toJson());

      final result = await firestore.collection('users').doc(user.uid).get();

      await _store.record(USERKEY).put(await _db, result.data(), merge: true);
    } catch (e) {
      print(e);
    }
  }
}
