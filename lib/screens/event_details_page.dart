import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lachancla/models/events_model.dart';
import 'package:url_launcher/url_launcher.dart';

class EventDetailsPage extends StatelessWidget {
  final EventsModel event;
  final CarouselController _controller = CarouselController();
  final DateFormat formatter = DateFormat('dd/MM/yyyy h:mm a');

  EventDetailsPage({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${event.title}"),
        actions: [
          IconButton(
            icon: Icon(Icons.map_outlined),
            onPressed: () async {
              Uri _url = Uri.parse(event.urlMaps);
              try {
                if (!await launchUrl(_url)) {
                  throw Exception('Could not launch $_url');
                }
              } catch (e) {
                final snackBar =
                    SnackBar(content: Text('Error con el link de maps'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),

          // aqui va a ir la imagen

          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 300.0,
                  width: double.infinity,
                  child: Image.network(
                    '${event.image}',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Card(
                          clipBehavior: Clip.antiAlias,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  'Start Date',
                                  style: TextStyle(fontSize: 24),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("${formatter.format(event.startDate)}"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Card(
                          clipBehavior: Clip.antiAlias,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  'End Date',
                                  style: TextStyle(fontSize: 24),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("${formatter.format(event.endDate)}"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Center(
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'Description',
                            style: TextStyle(fontSize: 24),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(event.description),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Card(
                          clipBehavior: Clip.antiAlias,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  'Capacity',
                                  style: TextStyle(fontSize: 24),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("${event.capacity}"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Card(
                          clipBehavior: Clip.antiAlias,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  'Estado',
                                  style: TextStyle(fontSize: 24),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("${event.state_name}"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
