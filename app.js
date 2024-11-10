const express = require('express');
const cors = require('cors'); // Import cors
const userRoutes = require('./routes/users');
const authenticateToken = require('./middleware/auth');
require('dotenv').config();

const app = express();

// Enable CORS for all origins (public API, if you want more restrictive access, see below)
app.use(cors()); // This allows all origins by default



// Middleware
app.use(express.json());

// Public routes
app.use('/api/users', userRoutes);

// Protected route example
app.get('/api/protected', authenticateToken, (req, res) => {
  res.status(200).json({ message: 'This is a protected route', user: req.user });
});

module.exports = app;
