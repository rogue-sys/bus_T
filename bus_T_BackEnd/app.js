//app.js
const express = require("express");
const bodyParser = require("body-parser");
const busScheduleRoutes = require("./routes/busScheduleRoutes");
const connectDB = require("./config/db")
connectDB();
const app = express()

// Middleware to parse JSON request bodies
app.use(bodyParser.json());
app.use("/api", busScheduleRoutes);

app.listen(5000,()=>console.log("server running on port 5000"))
