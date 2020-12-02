import logging
import signal
import sys

from flask import Flask
from openalpr import Alpr

LOG_FILE = '/root/oalpr/log/oalpr.log'
IMAGE_FILE = '/root/oalpr/data/plate.jpg'

logging.basicConfig(filename=LOG_FILE, filemode='w', format='%(asctime)s - %(message)s', level=logging.INFO)

app = Flask(__name__)
lpr = Alpr("eu", "/etc/openalpr/openalpr.conf", "/usr/share/openalpr/runtime_data")
lpr.set_default_region("pt")
if not lpr.is_loaded():
    logging.error("Error loading OpenALPR")
    sys.exit(1)


@app.route('/doIt')
def do_it():
    logging.info("Starting recognition")

    lpr_results = lpr.recognize_file(IMAGE_FILE)
    recognized_plates = ""
    for result in lpr_results["results"]:
        recognized_plates = result["plate"]

    if recognized_plates == "":
        text = "No plates recognized"
    else:
        text = "Recognized plates {}".format(recognized_plates)

    logging.info(text)

    return text


def signal_handler(sig, frame):
    logging.info('Received SIGINT. Unloading ALPR')
    lpr.unload()
    sys.exit(0)


try:
    signal.signal(signal.SIGINT, signal_handler)
    logging.info('ALPR loaded. Ready to recognize')
    app.run(host='0.0.0.0')
except Exception as e:
    logging.error("Exception occurred", exc_info=True)
