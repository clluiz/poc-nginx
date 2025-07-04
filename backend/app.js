const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  console.log('Request received at backend.');

  // Check for the user ID header added by the NGINX gateway
  const userId = req.header('X-User-ID');

  if (userId) {
    console.log(`Request validated for user: ${userId}`);
    res.status(200).send(`Hello from the backend! Your request was validated for user: ${userId}`);
  } else {
    console.log('Warning: Request reached backend WITHOUT a user ID.');
    res.status(200).send('Hello from the backend. Your request was NOT validated by the gateway.');
  }
});

app.listen(port, () => {
  console.log(`PoC backend listening on port ${port}`);
});