#!/usr/bin/env python

from flask import Flask, send_from_directory
from dotenv import load_dotenv
from logging import getLogger
from os import getenv

load_dotenv()
HOST = int(getenv("HOST") or "0.0.0.0")
PORT = int(getenv("PORT") or 8000)

logger = getLogger("werkzeug")
logger.disabled = True

app = Flask(__name__)

@app.route("/<path:filename>")
def main(filename):
  return send_from_directory("app", filename)

if __name__ == "__main__":
  app.run(
    port=PORT,
    host=HOST,
    debug=False
  )