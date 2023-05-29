const { default: axios } = require("axios");
const express = require("express");
const app = express();

// Middleware to parse JSON bodies
app.use(express.json());

// Sample data
let posts = [];

// GET request handler
app.get("/current_weathers", async (req, res) => {
  const { params, query, body } = req;
  const { city, limit } = query;
  //   console.log(query);
  const response = await axios.get(
    `http://api.openweathermap.org/geo/1.0/direct?q=${city}&limit=${limit}&appid=21e8633e94620085d4268191f264ff94`
  );
  const apiPosts = response.data;
  res.json(apiPosts);
});

// POST request handler
// app.post("/posts", (req, res) => {
//   const newPost = req.body;
//   posts.push(newPost);
//   res.status(201).json(newPost);
// });

// Start the server
const port = 3000;
app.listen(port, () => {
  console.log(`Server is listening on port ${port}`);
});
