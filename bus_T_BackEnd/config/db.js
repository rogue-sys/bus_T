// db.js

const mongoose = require('mongoose');
const BusSchedule = require('../models/busSchedule');

const connectDB = async () => {
  try {
    const connection = await mongoose.connect('mongodb+srv://aadhilmuhammed06:loqeHJQCX2pCgWtY@cluster0.w7td6kl.mongodb.net/test?retryWrites=true&w=majority&appName=Cluster0', {
      useNewUrlParser: true,
      useUnifiedTopology: true,
    });
    console.log('MongoDB connected:', connection.connection.host);
  } catch (error) {
    console.error('MongoDB connection error:', error);
    process.exit(1); // Exit process with failure
  }
};

module.exports = connectDB;
