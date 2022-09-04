from flask import Flask, Blueprint
from api.views import health

def create_app():
    api = Blueprint('api', __name__)
    app = Flask(__name__)

    # define api routes
    api.add_url_rule('/status', 'health', view_func=health, methods=['GET'])

    app.register_blueprint(api, url_prefix='/api')
    return app