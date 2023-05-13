import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lachancla/providers/upload_photo_provider.dart';
import 'package:provider/provider.dart';

class EditAvatarModal extends StatelessWidget {
  const EditAvatarModal();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit avatar'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(context.watch<UploadPhotoProvider>().nuevaImagen),
            radius: 48,
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  context.read<UploadPhotoProvider>().myAlert(context);
                },
              ),
              SizedBox(width: 8),
              Text("Edit"),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          child: Text('Cancel'),
          onPressed: () {
            context.read<UploadPhotoProvider>().cancelar();
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('Save'),
          onPressed: () {
            context.read<UploadPhotoProvider>().save(context);
          },
        ),
      ],
    );
  }
}
