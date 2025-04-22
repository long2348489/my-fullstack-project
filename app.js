const express = require('express');
const morgan = require('morgan');
const connectDB = require('./app.api/app/config/db');
const productRoutes = require('./app.api/app/routes/products');
const errorHandler = require('./app.api/app/middlewares/errorHandler');

const app = express();

// Connect to database
connectDB();

// Middlewares
app.use(morgan('dev'));
app.use(express.json());

// Routes
app.use('/api/products', productRoutes);

// Error handling
app.use(errorHandler);

module.exports = app;