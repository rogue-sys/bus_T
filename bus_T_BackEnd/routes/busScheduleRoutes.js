// routes/busScheduleRoutes.js

const express = require('express');
const router = express.Router();
const busScheduleController = require('../controllers/busScheduleController');

// Define route for fetching available buses for a specific route
router.post('/availableBuses', busScheduleController.getAvailableBuses);

// Define route for receiving source and destination data from Flutter app
router.post('/searchBuses', busScheduleController.searchBuses);
module.exports = router;
