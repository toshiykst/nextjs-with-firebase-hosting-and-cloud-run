import next from "next";
import express from "express";

const port = process.env.PORT || 3000;

const app = next({
  dev: true,
});

const handle = app.getRequestHandler();
const server = express();

server.get("*", (req, res) => {
  handle(req, res);
});

app
  .prepare()
  .then(() =>
    server.listen(port, () => {
      console.log(`> Ready on http://localhost:${port}`);
    })
  )
  .catch(console.error);

export default server;
