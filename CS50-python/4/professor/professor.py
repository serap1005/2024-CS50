import random


def main():
    level = get_level()
    score = 0
    for _ in range(10):
        if generate_integer(level):
            score += 1
    print(f"Your score: {score}/10")

def get_level():
    level_input=input("Level: ")
    while True:
        try:
            level=int(level_input)
            if level in [1,2,3]:
                return level
            else:
                False
        except ValueError:
            False

def generate_integer(level):
    if level == 1:
        X = random.randint(0, 9)
        Y = random.randint(0, 9)
    elif level == 2:
        X = random.randint(10, 99)
        Y = random.randint(10, 99)
    elif level == 3:
        X = random.randint(100, 999)
        Y = random.randint(100, 999)
    else:
        raise ValueError("Invalid level")
    answer = X + Y
    tries = 0

    while tries < 3:
        try:
            user_input = input(f"{X} + {Y} = ")
            user_answer = int(user_input)
            if user_answer == answer:
                return True
            else:
                print("EEE")
                tries += 1
        except ValueError:
            print("EEE")
            tries += 1

    print(f"The correct answer is {answer}")
    return False


if __name__ == "__main__":
    main()
