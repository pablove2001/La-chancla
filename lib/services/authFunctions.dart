import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lachancla/screens/home_page.dart';
import 'package:lachancla/services/firebaseFunctions.dart';

class AuthServices {
  static Future<bool> signupUser(String email, String password,
      String full_name, BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await FirebaseAuth.instance.currentUser!.updateDisplayName(full_name);
      await FirebaseAuth.instance.currentUser!.updateEmail(email);
      await FirebaseAuth.instance.currentUser!.updatePhotoURL(
          'https://user-images.githubusercontent.com/52970365/236108954-7cdd5f03-6539-4a32-82ba-afa96230d756.png');

      await FirestoreServices.saveUser(
          full_name, email, userCredential.user!.uid);

      await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).update({'gustos':[],'state_name':'Jalisco','favorite_events':[],'events_created':[], 'photoURL': 'https://user-images.githubusercontent.com/52970365/236108954-7cdd5f03-6539-4a32-82ba-afa96230d756.png'});
      
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Registration Successful')));
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Password Provided is too weak')));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Email Provided already Exists')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
    return false;
  }

  static Future<bool> signinUser(String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

      String uid = FirebaseAuth.instance.currentUser!.uid;

      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance.collection('users').doc(uid).get();

      Map<String, dynamic>? data = userSnapshot.data() as Map<String, dynamic>?;

      await FirebaseAuth.instance.currentUser!.updatePhotoURL(data!['photoURL']);

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('You are Logged in')));

      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('No user Found with this Email')));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Password did not match')));
      }
    }
    return false;
  }

  static bool isAlreadyAuthenticated() {
    return FirebaseAuth.instance.currentUser != null;
  }

  static Future<void> signOutFirebaseUser(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.push(context, MaterialPageRoute( builder: (context) => HomePage()));
  }

  static Future<void> signInWithGoogle() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken
    );

    UserCredential userCredential=await FirebaseAuth.instance.signInWithCredential(credential);

    print(userCredential.user?.email);
  }
}
