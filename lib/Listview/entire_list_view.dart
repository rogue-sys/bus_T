import 'package:flutter/material.dart';
import 'package:time_range_picker/time_range_picker.dart';

class BusListPage extends StatefulWidget {
  final List<Bus> busList;

 const BusListPage({super.key, required this.busList});

  

  @override
  BusListPageState createState() => BusListPageState();
}

class BusListPageState extends State<BusListPage> {
  TimeRange? selectedTimeRange;

  DateTime _convertTimeOfDayToDateTime(TimeOfDay time) {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, time.hour, time.minute);
  }

  TimeOfDay _parseTime(String time) {
    final parts = time.split(' ');
    final hourMinute = parts[0].split(':');
    int hour = int.parse(hourMinute[0]);
    final int minute = int.parse(hourMinute[1]);

    if (parts.length > 1) {
      final period = parts[1].toLowerCase();
      if (period == 'pm' && hour != 12) {
        hour += 12;
      } else if (period == 'am' && hour == 12) {
        hour = 0;
      }
    }

    return TimeOfDay(hour: hour, minute: minute);
  }

  List<Bus> _filterBusesByTimeRange(TimeRange timeRange) {
    return widget.busList.where((bus) {
      return bus.arrivalTimes.any((timeString) {
        final arrivalTime = _parseTime(timeString);
        final arrivalDateTime = _convertTimeOfDayToDateTime(arrivalTime);
        final startDateTime = _convertTimeOfDayToDateTime(timeRange.startTime);
        final endDateTime = _convertTimeOfDayToDateTime(timeRange.endTime);
        return arrivalDateTime.isAfter(startDateTime) && arrivalDateTime.isBefore(endDateTime);
      });
    }).toList();
  }

  void _chooseTime() async {
    final TimeRange? result = await showTimeRangePicker(
      context: context,
      interval: const Duration(minutes: 15),
      start: const TimeOfDay(hour: 9, minute: 0),
      end: const TimeOfDay(hour: 17, minute: 0),
      disabledTime: TimeRange(
        startTime:const TimeOfDay(hour: 22, minute: 0),
        endTime: const TimeOfDay(hour: 6, minute: 0),
      ),
      disabledColor: Colors.red.withOpacity(0.5),
      strokeWidth: 4,
      ticks: 12,
      ticksColor: Colors.grey,
      labels: [
        "12 am", "3 am", "6 am", "9 am", "12 pm", "3 pm", "6 pm", "9 pm"
      ].asMap().entries.map((e) {
        return ClockLabel.fromIndex(idx: e.key, length: 8, text: e.value);
      }).toList(),
      labelOffset: 35,
      padding: 60,
      rotateLabels: false,
      fromText: 'From',
      toText: 'To',
      hideButtons: true,
      backgroundWidget: Container(
        color: Colors.blue,
      ),
      
    strokeColor: Colors.green, 
    handlerColor: Colors.orange, 
    selectedColor: Colors.blue, 
    );

    setState(() {
      selectedTimeRange = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Bus> filteredBuses = selectedTimeRange != null ? _filterBusesByTimeRange(selectedTimeRange!) : widget.busList;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Available Buses',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: _chooseTime,
            child: const Text(
              'Choose Time',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: filteredBuses.isEmpty
          ? const Center(child:  Text('No buses available for selected time range', style: TextStyle(fontSize: 18.0)))
          : ListView.builder(
              itemCount: filteredBuses.length,
              itemBuilder: (BuildContext context, int index) {
                final bus = filteredBuses[index];
                return  Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Icon(Icons.directions_bus, color: Colors.white),
                      ),
                      title: Text('Vehicle Number: ${bus.vehicleNumber}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: bus.arrivalTimes
                            .map((time) => Text('Arrival Time: $time'))
                            .toList(),
                      ),
                      onTap: () {
                        print('Selected bus: ${bus.vehicleNumber}');
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}

class Bus {
  final String vehicleNumber;
  final List<String> arrivalTimes;

  Bus({required this.vehicleNumber, required this.arrivalTimes});
}


