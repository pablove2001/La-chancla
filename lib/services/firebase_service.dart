// import 'package:lachancla/models/events_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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

 Future<bool> updateUserStepper(List<String> gustos, String estado, BuildContext context) async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;

      await FirebaseFirestore.instance.collection('users').doc(uid).update({'gustos':gustos,'state_name':estado});

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Configuraciones guardadas')));

      return true;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Error guardando datos stepper')));
    }
    return false;
  }
