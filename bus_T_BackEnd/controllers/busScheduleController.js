// controllers/busScheduleController.js

// Import the BusSchedule model
const BusSchedule = require('../models/busSchedule');

// Controller function to fetch available buses for a specific route
exports.getAvailableBuses = async (req, res) => {
  // Extract source and destination from the request body
  const { source, destination } = req.body;

  try {
    // Find all bus schedules that contain the provided source and destination in their routes
    const foundBuses = await BusSchedule.find({
      route: { $in: [source, destination] }
    }, {
      VehicleNumber: 1, 
      schedule: 1,
    });

    // Send the list of available buses as the response
    res.json(availableBuses);
  } catch (error) {
    // If an error occurs, send an error response
    res.status(500).json({ message: error.message });
  }
};


exports.searchBuses = async (req, res) => {
  // Extract source and destination from the request body
  const { source, destination } = req.body;

  try {
    // Log the received source and destination values
    console.log(`Searching for buses from ${source} to ${destination}`);
    
    // Query the database for bus schedules matching the source or destination
    const foundBuses = await BusSchedule.find({
      route: { $all: [source, destination] }
    }, {
      VehicleNumber: 1, 
      schedule: 1,
    });

    // Process the found buses to extract vehicle numbers and arrival times
    const processedBuses = foundBuses.map(bus => {
      const { 'VehicleNumber': VehicleNumber, schedule } = bus;

      // Extract arrival times for the source location
      const arrivalTimes = schedule.reduce((times, trip) => {
        trip.stations.forEach(station => {
          if (station.station === source) {
            times.push(station.arrivalTime);
          }
        });
        return times;
      }, []);

      return {
        VehicleNumber,
        arrivalTimes
      };
    });

    // Print the final list to the console
    console.log('Processed buses:', JSON.stringify(processedBuses, null, 2));

    // Send the list of processed buses as the response
    res.json({ buses: processedBuses });

  } catch (error) {
    // If an error occurs, send an error response
    res.status(500).json({ message: error.message });
  }
};