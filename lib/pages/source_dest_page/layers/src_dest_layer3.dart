import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:bust_design/Listview/entire_list_view.dart';

class SrcDestLayer3 extends StatefulWidget {
  const SrcDestLayer3({super.key});

  @override
  State<SrcDestLayer3> createState() => _SrcDestLayer3State();
}

class _SrcDestLayer3State extends State<SrcDestLayer3> {
  final TextEditingController _sourceController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();

Future<void> sendDataToBackend(BuildContext context) async {
    final source = _sourceController.text.toUpperCase();
    final destination = _destinationController.text.toUpperCase();

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
    return Card(
      margin: EdgeInsets.zero,
      elevation: 15.0,
      shadowColor: Colors.blue,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(60.0),
      ),
      child: Container(
        width: 150.0,
        height: 150.0,
        // color: Colors.yellow,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 24.0,),
              Container(
                width: 250.0,
                height: 50.0,
                child: TextFormField(
                  controller: _sourceController,
                  decoration: InputDecoration(
                    labelText: "source",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
              Container(
                width: 250,
                height: 50.0,
                child: TextFormField(
                  controller: _destinationController,
                  decoration: InputDecoration(
                    labelText: "destination",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(onPressed: () {
                sendDataToBackend(context);
              }, child: const Text('search')),
            ],
          ),
        ),
      ),
    );
  }
}
