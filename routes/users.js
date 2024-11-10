require("dotenv").config(); // Load environment variables

const express = require("express");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const db = require("../config/bd");
const router = express.Router();

const JWT_SECRET = process.env.JWT_SECRET; // Access JWT secret from .env file

// Register route
router.post("/register", async (req, res) => {
  const { username, password, email, phone } = req.body;
  const hashedPassword = await bcrypt.hash(password, 10);

  const query =
    "INSERT INTO users (username, password , email , phone) VALUES (?, ? , ? , ?)";
  db.query(query, [username, hashedPassword, email, phone], (err, result) => {
    if (err) return res.status(500).json({ error: err.message });
    res.status(201).json({ message: "User registered successfully" });
  });
});

// Login route
router.post("/login", (req, res) => {
  const { username, password } = req.body;

  const query = "SELECT * FROM users WHERE username = ?";
  db.query(query, [username], async (err, results) => {
    if (err) return res.status(500).json({ error: err.message });
    if (results.length === 0)
      return res.status(400).json({ error: "User not found" });

    const user = results[0];
    const passwordMatch = await bcrypt.compare(password, user.password);

    if (!passwordMatch) {
      return res.status(400).json({ error: "Incorrect password" });
    }

    // Generate JWT token
    const token = jwt.sign(
      { id: user.id, username: user.username },
      JWT_SECRET,
      { expiresIn: "1h" }
    );
    res.status(200).json({ message: "Login successful", token });
  });
});

module.exports = router;
