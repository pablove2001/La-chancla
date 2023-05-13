import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lachancla/services/firebase_service.dart';

class UploadPhotoProvider with ChangeNotifier {
  final ImagePicker picker = ImagePicker();
  XFile? image;
  String imageURL = FirebaseAuth.instance.currentUser!.photoURL!;
  String nuevaImagen = FirebaseAuth.instance.currentUser!.photoURL!;
  
  Future<void> getImage(ImageSource media) async {
    var img = await picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 100,
      maxWidth: 100,
      imageQuality: 75,
    );
    if (img == null) return;
    this.image = img;
    if (this.image != null) {
      this.nuevaImagen = await subirImagenAFirebase(this.image!);
    }    
    
    notifyListeners();
  }

  void myAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: Text('Please choose media to select'),
          content: Container(
            height: MediaQuery.of(context).size.height / 6,
            child: Column(
              children: [
                ElevatedButton(
                  //if user click this button, user can upload image from gallery
                  onPressed: () {
                    Navigator.pop(context);
                    getImage(ImageSource.gallery);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.image),
                      Text('From Gallery'),
                    ],
                  ),
                ),
                ElevatedButton(
                  //if user click this button. user can upload image from camera
                  onPressed: () {
                    Navigator.pop(context);
                    getImage(ImageSource.camera);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.camera),
                      Text('From Camera'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<bool> save(BuildContext context) async {
    try {
      if (this.nuevaImagen != this.imageURL) {
        bool subir = await actualizarFotoPerfil(this.nuevaImagen);
        
        if (!subir) {
          ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Foto de perfil no actualizada')));
          return false;
        }

        this.imageURL = FirebaseAuth.instance.currentUser!.photoURL!;
        notifyListeners();
        ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Foto de perfil actualizada')));
        Navigator.of(context).pop();
        return true;
      }
      
    } catch (e) {}
    ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Foto de perfil no actualizada')));
    return false;
  }

  void cancelar(){
    this.nuevaImagen = this.imageURL;
  }
}
