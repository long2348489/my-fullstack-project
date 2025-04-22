const mongoose = require('mongoose');

const connectDB = async () => {
  try {
    await mongoose.connect('mongodb+srv://tmts21991:Yukimura1991!@489.qely55q.mongodb.net/my_fullstack_project?retryWrites=true&w=majority&appName=489');
    console.log('MongoDB connected');
  } catch (err) {
    console.error('Database connection error:', err);
    process.exit(1);
  }
};

module.exports = connectDB;