import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserAuthRepository {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ["email"]);
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool isAlreadyAuthenticated() {
    return _auth.currentUser != null;
  }

  bool validParams(email, password) {
    if (email == "" || password == "") {
      return false;
    }
    return true;
  }

  Future<String> signInUserPassword(email, password) async {
    try {
      if (!validParams(email, password)) {
        return "invalid-credentials";
      }
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      String uid = _auth.currentUser!.uid;

      DocumentSnapshot userSnapshot =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();

      Map<String, dynamic>? data = userSnapshot.data() as Map<String, dynamic>?;

      await _auth.currentUser!.updatePhotoURL(data!['photoURL']);

      return "success";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print("User not found");
        /*ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('No user Found with this Email')));*/
      } else if (e.code == 'wrong-password') {
        print("Wrong password");
        /*ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Password did not match')));*/
      }
      return e.code;
    }
  }

  Future<void> signOutGoogleUser() async {
    if (_googleSignIn.currentUser != null) {
      await _googleSignIn.signOut();
    }
  }

  Future<void> signOutFirebaseUser() async {
    await _auth.signOut();
  }

  Future<void> signUpUserWithPass(email, password, full_name) async {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    await _auth.currentUser!.updateDisplayName(full_name);
    await _auth.currentUser!.updateEmail(email);
    await _auth.currentUser!.updatePhotoURL(
        'https://user-images.githubusercontent.com/52970365/236108954-7cdd5f03-6539-4a32-82ba-afa96230d756.png');

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userCredential.user!.uid)
        .set({'email': email, 'name': full_name});

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userCredential.user!.uid)
        .update({
      'gustos': [],
      'state_name': 'Jalisco',
      'favorite_events': [],
      'events_created': [],
      'photoURL':
          'https://user-images.githubusercontent.com/52970365/236108954-7cdd5f03-6539-4a32-82ba-afa96230d756.png'
    });
  }

  Future<void> signInWithGoogle() async {
    final googleUser = await _googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    print(">> User name: ${googleUser.displayName}");
    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );
    await _auth.signInWithCredential(credential);
  }
}
