# Dingen

[honcho]: https://github.com/nickstenning/honcho

In order to start the development server:

* get [honcho][honcho] installed
* install dependencies with `make dev-setup`
* start the server with `make dev-server`
* there should be two new browser tabs popping up, otherwise consult the
  terminal output to determine the correct urls for the frontend and admin

In case you want to connect to the development server instance using `iex`:

```
iex --sname dingen-remsh --remsh dingen@your-hostname-here
```

(of course using the correct hostname)
