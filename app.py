from flask import Flask
from faker import Faker

app = Flask(__name__)
faker = Faker()


@app.route("/")
def fake_use():
    users_emails = []
    for user_email in range(5):
        user_email = faker.email(users_emails)
        users_emails.append(user_email)
    return f" e-adress: {users_emails}"


if __name__ == "__main__":
    fake_use()
