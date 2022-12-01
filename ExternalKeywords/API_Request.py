import requests
import json


def make_api_request(url=""):
    response = requests.get(url)
    # validate status code
    assert response.status_code == 200
    return
