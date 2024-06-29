// models/busSchedule.js

const mongoose = require('mongoose');

// Define the schema for bus schedules
const busScheduleSchema = new mongoose.Schema({
  VehicleNumber: { type: String, required: true },
  route: [{ type: String, required: true }],
  schedule: [{
    trip: { type: Number, required: true },
    stations: [{
      station: { type: String, required: true },
      arrivalTime: { type: String, required: true },
      departureTime: { type: String, required: true }
    }]
  }]
}
);

// Create a model using the schema
const BusSchedule = new mongoose.model('busschedules', busScheduleSchema);

module.exports = BusSchedule;


