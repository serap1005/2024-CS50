## connect via python to sqlite database
## alter admin password
from cs50 import SQL
db=SQL("sqlite:///dont-panic.db")
password=input("Enter a password: ")
db.execute(
    """
    UPDATE "users"
    SET "password" = ?
    WHERE "username"='admin';
    """,
    password
)
print("Hacked!")
