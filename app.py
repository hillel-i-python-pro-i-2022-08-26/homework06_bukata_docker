from flask import Flask
from faker import Faker

app = Flask(__name__)
faker = Faker()


@app.route("/")
def fake_use():
    for _ in range(5):
        return f" e-adress: {faker.email()}"


if __name__ == "__main__":
    fake_use()
