import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:lachancla/models/events_model.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getFilteredEventsFirebase() async {
  if (FirebaseAuth.instance.currentUser == null) return [];
  String uid = FirebaseAuth.instance.currentUser!.uid;
  DocumentSnapshot userSnapshot = await FirebaseFirestore.instance.collection('users').doc(uid).get();
  
  Map<String, dynamic>? data = userSnapshot.data() as Map<String, dynamic>?;

  List events = [];

  QuerySnapshot queryEvents = await FirebaseFirestore.instance.collection('events').where('state_name', isEqualTo: data!['state_name']).get();

  queryEvents.docs.forEach((doc) {
    events.add(doc.data());
  });

  return events;
}

Future<List> getAllEventsFirebase() async {
  List events = [];

  QuerySnapshot queryEvents = await FirebaseFirestore.instance.collection('events').get();

  queryEvents.docs.forEach((doc) {
    events.add(doc.data());
  });

  return events;
}

Future<List> getUserEventsFirebase(String uid) async {
  List userEvents = [];

  CollectionReference collectionReferenceEvents = db.collection('events');
  // Filtrar los registros donde el campo "id_organizer" sea igual a tu "uid"
  QuerySnapshot queryEvents = await collectionReferenceEvents
      .where('id_organizer', isEqualTo: uid)
      .get();

  queryEvents.docs.forEach((doc) {
    userEvents.add(doc.data());
  });

  return userEvents;
}

Future<bool> borrarEventoFirebase(EventsModel event) async {
  try {
    await FirebaseFirestore.instance
      .collection('events')
      .where('title', isEqualTo: event.title)
      .where('capacity', isEqualTo: event.capacity)
      .where('description', isEqualTo: event.description)
      .where('id_organizer', isEqualTo: event.id_organizer)
      .where('image', isEqualTo: event.image)
      .where('state_name', isEqualTo: event.state_name)
      .where('urlMaps', isEqualTo: event.urlMaps)
      .get()
      .then((querySnapshot) {
        querySnapshot.docs.forEach((document) {
          document.reference.delete();
        });
      });
    return true;
  } catch (e) {
    return false;
  }
}

Future<bool> updateUserStepper(
    List<String> gustos, String estado, BuildContext context) async {
  try {
    // sacar el uid del currentUser
    String uid = FirebaseAuth.instance.currentUser!.uid;

    // actualizar gustos y state_name del currentUser
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .update({'gustos': gustos, 'state_name': estado});

    // mostrar ScaffoldMessenger
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Configuraciones guardadas')));

    await getFilteredEventsFirebase();

    return true;
  } on FirebaseAuthException catch (e) {
    print(e);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Error guardando datos stepper')));
  }
  return false;
}

Future<bool> createEventService(
    int capacity,
    String descritpion,
    DateTime startDate,
    DateTime endDate,
    XFile? image,
    String estado,
    String title,
    String mapsURL) async {
  try {
    // sacar el uid del currentUser
    String uid = FirebaseAuth.instance.currentUser!.uid;

    // subir imagen a firebase
    String? imageURL;
    if (image != null) {
      imageURL = await subirImagenAFirebase(image);
    }

    // se añade evento a la colecion events
    var eventoRef = await db.collection('events').add({
      'endDate': Timestamp.fromDate(endDate),
      'startDate': Timestamp.fromDate(startDate),
      'capacity': capacity,
      'description': descritpion,
      'image':
          imageURL ?? 'https://avatars.githubusercontent.com/u/43918722?v=4',
      'state_name': estado,
      'title': title,
      'urlMaps': mapsURL,
      'id_organizer': uid
    });

    // se trae la info del usuario
    DocumentSnapshot userSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    Map<String, dynamic>? data = userSnapshot.data() as Map<String, dynamic>?;
    // se añade el nuevo evento
    data!['events_created'].add(eventoRef.id);
    // se sube los nuevos eventos del usuario
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .update({'events_created': data['events_created']});

    // todo bien retorna true
    return true;
  } on FirebaseAuthException catch (e) {
    print(e);
  }
  // mal retorna false
  return false;
}

Future<String> subirImagenAFirebase(XFile imagen) async {
  try {
    // sacar el uid del currentUser
    String uid = FirebaseAuth.instance.currentUser!.uid;

    // subir imagen a firebase
    String imageURL = await FirebaseStorage.instance
        .ref('events/$uid/${DateTime.now().toString()}')
        .putFile(File(imagen.path))
        .then(
          (value) => value.ref.getDownloadURL(),
        );
    return imageURL;
  } on FirebaseAuthException catch (e) {
    print(e);
  }
  return 'https://avatars.githubusercontent.com/u/43918722?v=4';
}

Future<bool> actualizarFotoPerfil(String url) async {
  String uid = FirebaseAuth.instance.currentUser!.uid;

  try {
    await FirebaseFirestore.instance.collection('users').doc(uid).update({'photoURL': url });
    await FirebaseAuth.instance.currentUser!.updatePhotoURL(url);
    return true;
  } catch(e) {
    return false;
  }
}