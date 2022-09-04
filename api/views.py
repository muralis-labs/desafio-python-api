from flask import json, jsonify, request

def health():
    responseBody = {
        "status": "Service Running"
    }
    return jsonify(responseBody)