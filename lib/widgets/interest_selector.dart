import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:firebase_auth/firebase_auth.dart';

class InterestSelector extends StatelessWidget {
  InterestSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return /*Scaffold(
      /*appBar: AppBar(
        title: Text('Material App Bar'),
      ),*/
      body: */
        Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hola ${FirebaseAuth.instance.currentUser?.displayName ?? 'Sin Nombre'}",
                  style: TextStyle(fontFamily: 'Lobster', fontSize: 36),
                ),
                Text(
                  "¡Comencemos!",
                  style: TextStyle(
                    fontFamily: 'Lobster',
                    fontSize: 15,
                  ),
                ),
                Text(
                  "Cuentame tus gustos...",
                  style: TextStyle(
                    fontFamily: 'Lobster',
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          MultiSelectContainer(
              itemsDecoration: MultiSelectDecorations(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(229, 168, 85, 1),
                    borderRadius: BorderRadius.circular(20)),
                selectedDecoration: BoxDecoration(
                    color: Color.fromRGBO(218, 130, 12, 1),
                    borderRadius: BorderRadius.circular(5)),
                disabledDecoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(color: Colors.grey[500]!),
                    borderRadius: BorderRadius.circular(10)),
              ),
              items: [
                MultiSelectCard(value: 'Dart', label: 'Dart'),
                MultiSelectCard(value: 'Python', label: 'Python'),
                MultiSelectCard(value: 'JavaScript', label: 'JavaScript'),
                MultiSelectCard(value: 'Java', label: 'Java'),
                MultiSelectCard(value: 'C#', label: 'C#'),
                MultiSelectCard(value: 'C++', label: 'C++'),
                MultiSelectCard(value: 'Go Lang', label: 'Go Lang'),
                MultiSelectCard(value: 'Swift', label: 'Swift'),
                MultiSelectCard(value: 'PHP', label: 'PHP'),
                MultiSelectCard(value: 'Kotlin', label: 'Kotlin'),
              ],
              onChange: (allSelectedItems, selectedItem) {}),
        ],
      ),
    );
    //);
  }
}
