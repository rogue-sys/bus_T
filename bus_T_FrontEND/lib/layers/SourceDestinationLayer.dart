import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:bust/listView.dart';

class SourceDestinationLayer extends StatefulWidget {
  const SourceDestinationLayer({Key? key}) : super(key: key);

  @override
  _SourceDestinationLayerState createState() => _SourceDestinationLayerState();
}

class _SourceDestinationLayerState extends State<SourceDestinationLayer> {
  final TextEditingController _sourceController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();

  Future<void> sendDataToBackend(BuildContext context) async {
    final source = _sourceController.text;
    final destination = _destinationController.text;

    // Send source and destination names to the backend
    String url =
        'http://192.168.20.5:5000/api/searchBuses'; // Replace with your backend endpoint URL
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode({'source': source, 'destination': destination}),
      headers: {'Content-Type': 'application/json'},
    );

    // Check the response status
    if (response.statusCode == 200) {
      // Extract list of available buses from the response
      List<dynamic> responseData = jsonDecode(response.body)['buses'];
      List<Bus> busList = responseData.map((busData) {
        return Bus(
          vehicleNumber: busData['VehicleNumber'],
          arrivalTimes: List<String>.from(busData['arrivalTimes']),
        );
      }).toList();

      // Navigate to another page to display the list of buses
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BusListPage(busList: busList),
        ),
      );
    } else {
      // Failed to send data to the backend
      print('Failed to send data to the backend');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 584,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 100,
            left: 59,
            child: Container(
              width: 310,
              alignment: Alignment.topLeft,
              child: TextFormField(
                controller: _sourceController,
                decoration: InputDecoration(
                    labelText: 'Source',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey))),
              ),
            ),
          ),
          Positioned(
            top: 200,
            left: 59,
            child: Container(
              width: 310,
              alignment: Alignment.topCenter,
              child: TextFormField(
                controller: _destinationController,
                decoration: InputDecoration(
                    labelText: 'Destination',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey))),
              ),
            ),
          ),
          Positioned(
            top: 300,
            left: 59,
            child: ElevatedButton(
              onPressed: () => sendDataToBackend(context),
              child: Text('Send Data'),
            ),
          ),
        ],
      ),
    );
  }
}