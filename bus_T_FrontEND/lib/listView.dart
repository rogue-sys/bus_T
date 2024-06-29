import 'package:flutter/material.dart';

class Bus {
  final String vehicleNumber;
  final List<String> arrivalTimes;

  Bus({
    required this.vehicleNumber,
    required this.arrivalTimes,
  });
}

class BusListPage extends StatefulWidget {
  final List<Bus> busList;

  BusListPage({Key? key, required this.busList}) : super(key: key);

  @override
  _BusListPageState createState() => _BusListPageState();
}

class _BusListPageState extends State<BusListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Buses'),
        actions: [
          TextButton(
            onPressed: () {
              // Handle choose time button press
              print('Choose Time button pressed');
            },
            child: Text(
              'Choose Time',
              style: TextStyle(color: Colors.white),
            ),
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue, // Background color
            ),
          ),
        ],
      ),
      body: widget.busList.isEmpty
          ? Center(child: Text('No data to display'))
          : Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/primaryBg.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: ListView.builder(
                itemCount: widget.busList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Icon(Icons.directions_bus, color: Colors.white),
                        ),
                        title: Text('Vehicle Number: ${widget.busList[index].vehicleNumber}'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: widget.busList[index].arrivalTimes.map((time) => 
                            Text('Arrival Time: $time')
                          ).toList(),
                        ),
                        onTap: () {
                          // Handle bus selection
                          print('Selected bus: ${widget.busList[index].vehicleNumber}');
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}