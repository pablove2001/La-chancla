import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

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
    // sacar el uid del currentUser
    String uid = FirebaseAuth.instance.currentUser!.uid;

    // actualizar gustos y state_name del currentUser
    await FirebaseFirestore.instance.collection('users').doc(uid).update({'gustos':gustos,'state_name':estado});

    // mostrar ScaffoldMessenger
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Configuraciones guardadas')));

    return true;
  } on FirebaseAuthException catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error guardando datos stepper')));
  }
  return false;
}

Future<bool> createEventService(int capacity, String descritpion, DateTime startDate, DateTime endDate, XFile? image, String estado, String title, String mapsURL) async {
  try {
    // sacar el uid del currentUser
    String uid = FirebaseAuth.instance.currentUser!.uid;

    // subir imagen a firebase
    String? imageURL;
    if (image != null) {
      imageURL = await subirImagenAFirebase(image);
    }

    // se añade evento a la colecion events
    var eventoRef = await db.collection('events').add({ 'endDate': Timestamp.fromDate(endDate), 'startDate': Timestamp.fromDate(startDate),'capacity': capacity, 'description':descritpion, 'image': imageURL??'https://avatars.githubusercontent.com/u/43918722?v=4', 'state_name':estado, 'title':title, 'urlMaps':mapsURL, 'id_organizer':uid});

    // se trae la info del usuario
    DocumentSnapshot userSnapshot = await FirebaseFirestore.instance.collection('users').doc(uid).get();
    Map<String, dynamic>? data = userSnapshot.data() as Map<String, dynamic>?;
    // se añade el nuevo evento
    data!['events_created'].add(eventoRef.id);
    // se sube los nuevos eventos del usuario
    await FirebaseFirestore.instance.collection('users').doc(uid).update({'events_created':data!['events_created']});

    // todo bien retorna true
    return true;
  } on FirebaseAuthException catch (e) {}
  // mal retorna false
  return false;
}

Future<String> subirImagenAFirebase(XFile imagen) async {
  return 'https://avatars.githubusercontent.com/u/43918722?v=4';
}