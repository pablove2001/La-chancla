import 'package:flutter/material.dart';

class Events_Page extends StatelessWidget {
  const Events_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 216, 187, 1),
      /*appBar: AppBar(
        title: Text('Material App Bar'),
      ),*/
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              Container(
                child: Column(
                  children: [
                    Text(
                      "Hola Mariana",
                      style: TextStyle(
                          fontFamily: 'Lobster',
                          fontSize: 36,
                          color: Colors.black),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        "Encontré estos eventos que podrían interesarte!",
                        style: TextStyle(
                          fontFamily: 'Lobster',
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            top: 200,
            bottom: 0,
            left: 0,
            right: 0,
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              itemCount: 8,
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(229, 168, 85, 1),
                          borderRadius: BorderRadius.circular(10)),
                      margin: EdgeInsets.all(10),
                      child: ListTile(
                        title: Image.network(
                          "https://knightsbanner.com/wp-content/uploads/2018/02/The_Greatest_Showman-copy-900x400.png",
                          width: 50,
                          height: 100,
                        ),
                        subtitle: Center(child: Text("The greatest Shownman")),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),

      /*
      Column(children: [
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
                      "Encontré estos eventos que podrían interesarte",
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
              /*ListTile(
                title: Image.network(
                    "https://knightsbanner.com/wp-content/uploads/2018/02/The_Greatest_Showman-copy-900x400.png"),
                subtitle: Text("The greates Shownman"),
              )*/
              ListView.separated(
                itemCount: 1,
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Image.network(
                        "https://knightsbanner.com/wp-content/uploads/2018/02/The_Greatest_Showman-copy-900x400.png"),
                    subtitle: Text("The greates Shownman"),
                  );
                },
              ),
            ],
          ),
        )
      ]),*/
    );
  }
}
