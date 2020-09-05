import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsckssem/models/event.dart';

class AppRepository {
  /// Firestore instance
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<Event>> getEvents() async {
    try {
      List<Event> events = [];
      final result = await firestore.collection('events').get();

      result.docs.forEach((doc) {
        Event eve = Event.fromJson(doc.data());
        events.add(eve);
      });
      print(events);
      return events;
    } catch (e) {
      return [];
    }
  }
}
