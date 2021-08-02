#!/usr/bin/env node

import { publish } from "gh-pages";

(function () {
  publish("./app", (err) => {
    console.log(err);
    process.exit(1);
  });
}.call(this));
