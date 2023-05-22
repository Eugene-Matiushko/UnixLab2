const express = require("express");
const cors = require("cors");
const app = express();
app.use(cors());
app.use(express.json());

const items = ["hi"];

app.get("/items", (req, res) => {
  res.json(items);
});

app.post("/items", (req, res) => {
  console.log(req.body);
  let item = req.body.item;
  items.push(item);
  res.status();
});

app.listen(5000, () => {
  console.log("Server started on port  5000");
});
