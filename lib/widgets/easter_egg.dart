import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EasterEgg extends StatefulWidget {
  @override
  _EasterEggState createState() => _EasterEggState();
}

class _EasterEggState extends State<EasterEgg> {
  String imageUrl =
      'https://user-images.githubusercontent.com/52970365/232803113-919c14c2-5511-42c2-8103-9e772b72ecfe.png';

  void _fetchWaifu() async {
    final response =
        await http.get(Uri.parse('https://api.waifu.pics/sfw/waifu'));
    final data = jsonDecode(response.body);
    setState(() {
      imageUrl = data['url'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: imageUrl == null
          ? CircularProgressIndicator()
          : Image.network(imageUrl),
      actions: <Widget>[
        TextButton(
          child: Text('Cerrar'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('Obtener waifu'),
          onPressed: () {
            _fetchWaifu();
          },
        ),
      ],
    );
  }
}
