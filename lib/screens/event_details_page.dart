import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lachancla/models/events_model.dart';
import 'package:lachancla/providers/event_details_provider.dart';
import 'package:lachancla/widgets/image_coursel_slider.dart';
import 'package:provider/provider.dart';

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
            icon: Icon(Icons.favorite),
            onPressed: () {},
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
                        Text(
                          'Start Date:',
                          style: TextStyle(fontSize: 24),
                        ),
                        Text("${formatter.format(event.startDate)}"),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'End Date:',
                          style: TextStyle(fontSize: 24),
                        ),
                        Text("${formatter.format(event.endDate)}"),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Text(
                  'Description:',
                  style: TextStyle(fontSize: 24),
                ),
                Text(event.description),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Capacity:',
                          style: TextStyle(fontSize: 24),
                        ),
                        Text("${event.capacity}"),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Place:',
                          style: TextStyle(fontSize: 24),
                        ),
                        Text(event.urlMaps.substring(0, 16)),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Text(
                  'Estado:',
                  style: TextStyle(fontSize: 24),
                ),
                Text("${event.state_name}"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
