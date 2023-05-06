import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UpdateEventsPage extends StatelessWidget {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController capacityController = TextEditingController();
  TextEditingController urlMapsController = TextEditingController();
  TextEditingController statusCOntroller = TextEditingController();
  UpdateEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(
              "Actualizar Evento",
              style: TextStyle(fontFamily: 'Lobster', fontSize: 36),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 30.0,
                left: 30.0,
                right: 30.0,
              ),
              child: Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: titleController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter a new title...',
                        labelText: 'New title',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: descriptionController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter a new description...',
                        labelText: 'New description',
                      ),
                      maxLines: 5,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: urlMapsController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter a new Google Maps url...',
                        labelText: 'New Google Maps',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: capacityController,
                      decoration: InputDecoration(labelText: "New capacity"),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.red,
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.blue,
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Submit",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
