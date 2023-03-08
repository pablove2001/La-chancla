import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:lachancla/events_page.dart';

class StartingPage extends StatelessWidget {
  StartingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 216, 187, 1),
      /*appBar: AppBar(
        title: Text('Material App Bar'),
      ),*/
      body: Column(children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hola Mariana",
                      style: TextStyle(
                          fontFamily: 'Lobster',
                          fontSize: 36,
                          color: Colors.black),
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
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Container(
                  /*child: Image.asset(
                  "assets/images/ruleta.png",
                  width: 200,
                  height: 100,
                ),*/
                  child: MultiSelectContainer(
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
                        MultiSelectCard(
                            value: 'JavaScript', label: 'JavaScript'),
                        MultiSelectCard(value: 'Java', label: 'Java'),
                        MultiSelectCard(value: 'C#', label: 'C#'),
                        MultiSelectCard(value: 'C++', label: 'C++'),
                        MultiSelectCard(value: 'Go Lang', label: 'Go Lang'),
                        MultiSelectCard(value: 'Swift', label: 'Swift'),
                        MultiSelectCard(value: 'PHP', label: 'PHP'),
                        MultiSelectCard(value: 'Kotlin', label: 'Kotlin')
                      ],
                      onChange: (allSelectedItems, selectedItem) {})),
              Container(
                padding: EdgeInsets.only(top: 170, bottom: 70),
                child: MaterialButton(
                  color: Colors.blue[100],
                  child: Text("Comenzar"),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Events_Page(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
