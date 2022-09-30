from flask import Flask
from faker import Faker

faker = Faker()


app = Flask(__name__)


def fake_use():  # put application's code here
    return f" {faker.name} e-adress: {faker.email()}"
