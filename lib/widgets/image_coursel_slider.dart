import 'package:flutter/material.dart';

class ImageCourselSLider extends StatelessWidget {
  final String item;
  const ImageCourselSLider({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: Image.network(item, fit: BoxFit.cover, width: 1000.0),
      ),
    );
  }
}
