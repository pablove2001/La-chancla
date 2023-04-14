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
      backgroundColor: Color.fromRGBO(238, 216, 187, 1),
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
          CarouselSlider(
            items: event.images
                .map((item) => ImageCourselSLider(
                      item: item,
                    ))
                .toList(),
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: false,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  context
                      .read<EventDetailsProvider>()
                      .setCurrentPageIndex(index);
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: event.images.asMap().entries.map(
              (entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black)
                            .withOpacity(context
                                        .watch<EventDetailsProvider>()
                                        .getCurrentPageIndex ==
                                    entry.key
                                ? 0.9
                                : 0.4)),
                  ),
                );
              },
            ).toList(),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                          'Price:',
                          style: TextStyle(fontSize: 24),
                        ),
                        Text("\$ ${event.price.toStringAsFixed(2)}"),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Capacity:',
                          style: TextStyle(fontSize: 24),
                        ),
                        Text(
                            "${event.capacityNotAvailable} / ${event.capacity}"),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Text(
                  'Recomendations:',
                  style: TextStyle(fontSize: 24),
                ),
                Text(event.recommendations),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Place:',
                          style: TextStyle(fontSize: 24),
                        ),
                        Text(event.place),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Age:',
                          style: TextStyle(fontSize: 24),
                        ),
                        Text("From ${event.minimumAge} to ${event.maximumAge}"),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Text(
                  'Language:',
                  style: TextStyle(fontSize: 24),
                ),
                Text(event.language),
              ],
            ),
          )
        ],
      ),
    );
  }
}
