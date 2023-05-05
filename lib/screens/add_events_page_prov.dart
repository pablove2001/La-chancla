import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:lachancla/providers/add_events_provider.dart';
import 'package:lachancla/widgets/states_builder.dart';
import 'package:provider/provider.dart';

class AddEventsPageProv extends StatelessWidget {
  AddEventsPageProv({super.key});
  final f = new DateFormat('yyyy-MM-dd HH:mm a');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(
              "Create Event",
              style: TextStyle(fontFamily: 'Lobster', fontSize: 36),
            ),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 30.0,
                      left: 30.0,
                      right: 30.0,
                    ),
                    child: Form(
                      child: Column(
                        children: [
                          Container(
                            width: 200,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.green,
                            ),
                            child: TextButton.icon(
                              onPressed: () {
                                context
                                    .read<AddEventsProvider>()
                                    .myAlert(context);
                                //myAlert();
                              },
                              icon: Icon(
                                Icons.upload,
                                color: Colors.black,
                              ),
                              label: Text(
                                "Upload image",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          context.watch<AddEventsProvider>().image != null
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.file(
                                      //to show image, you type like this.
                                      File(context
                                          .watch<AddEventsProvider>()
                                          .image!
                                          .path),
                                      fit: BoxFit.cover,
                                      width: MediaQuery.of(context).size.width,
                                      height: 300,
                                    ),
                                  ),
                                )
                              : Text(
                                  "No Image",
                                  style: TextStyle(fontSize: 20),
                                ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: context
                                .read<AddEventsProvider>()
                                .titleController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter a title...',
                              labelText: 'Title',
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: context
                                .read<AddEventsProvider>()
                                .descriptionController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter a description...',
                              labelText: 'Description',
                            ),
                            maxLines: 5,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: context
                                .read<AddEventsProvider>()
                                .urlMapsController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter a Google Maps url...',
                              labelText: 'Google Maps',
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            controller: context
                                .read<AddEventsProvider>()
                                .capacityController,
                            decoration: InputDecoration(labelText: "Capacity"),
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          StatesBuilder(),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                          "${f.format(context.watch<AddEventsProvider>().selectedDate)}"),
                      ElevatedButton(
                        onPressed: () => context
                            .read<AddEventsProvider>()
                            .selectDateTime(context),
                        child: Text('Start event date'),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                          "${f.format(context.watch<AddEventsProvider>().endDate)}"),
                      ElevatedButton(
                        onPressed: () => context
                            .read<AddEventsProvider>()
                            .endSelectDateTime(context),
                        child: Text('End event date'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
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
                            context.read<AddEventsProvider>().cleanValues();
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
                          onPressed: () {
                            print("Submit" + DateTime.now().toString());
                            context.read<AddEventsProvider>().printValues();
                          },
                          child: Text(
                            "Submit",
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
