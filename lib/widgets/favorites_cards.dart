import 'package:flutter/material.dart';

class FavoritesCards extends StatelessWidget {
  const FavoritesCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.network(
            "https://i.stack.imgur.com/Of2w5.jpg",
          ),
        ),
        title: Text('Melbourne Cricket Stadium'),
        subtitle: Text('Australia'),
        trailing: MaterialButton(
          child: Icon(
            Icons.favorite,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
