import 'package:flutter/material.dart';

class EditAvatarModal extends StatelessWidget {
  const EditAvatarModal({required this.profileImage});
  final String profileImage;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit avatar'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(profileImage),
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
                  // Lógica para editar la imagen aquí
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
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('Save'),
          onPressed: () {
            // Lógica para guardar la imagen aquí
          },
        ),
      ],
    );
  }
}
