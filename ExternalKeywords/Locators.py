import json
import jsonpath


def read_locators_from_json(location):
    f = open('C:/Users/mariu/PycharmProjects/setupProject/jsonFiles/elements.json')
    response = json.loads(f.read())
    value = jsonpath.jsonpath(response, location)
    return value
