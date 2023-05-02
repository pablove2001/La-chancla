import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StatesBuilder extends StatefulWidget {
  const StatesBuilder({Key? key}) : super(key: key);

  @override
  _StatesBuilderState createState() => _StatesBuilderState();
}

class _StatesBuilderState extends State<StatesBuilder> {
  String? _selectedState = 'Jalisco';

  Future<List<String>> _fetchStates() async {
    final response = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/dantaex/ciudades_mexico/master/states_mexico.json'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonStates = jsonDecode(response.body)['states'];
      final List<String> stateNames =
          jsonStates.map((state) => state['name'] as String).toList();
      return stateNames;
    } else {
      throw Exception('Failed to fetch states');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Selecciona tu estado:"),
      FutureBuilder<List<String>>(
        future: _fetchStates(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final stateNames = snapshot.data!;
            return DropdownButton<String>(
              value: _selectedState,
              items: stateNames
                  .map((stateName) => DropdownMenuItem<String>(
                        value: stateName,
                        child: Text(stateName),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedState = value;
                });
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    ]);
  }
}
