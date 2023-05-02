// import 'package:lachancla/models/events_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getEventsFirebase() async {
  List events = [];
  CollectionReference collectionReferenceEvents = db.collection('events');

  QuerySnapshot queryEvents = await collectionReferenceEvents.get();

  queryEvents.docs.forEach((doc) {
    events.add(doc.data());
  });

  return events;
}
