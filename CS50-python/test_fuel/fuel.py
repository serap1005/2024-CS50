def main():
    fraction = input("Fraction: ")
    percentage = convert(fraction)
    print(gauge(percentage))


def convert(s):
    x, y = s.split("/")
    if int(y) == 0:
        raise ZeroDivisionError
    if int(x)/int(y) > 1:
        raise ValueError
    return int(int(x)/int(y) * 100)


def gauge(a):
    if 0 <= a <= 1:
        return "E"
    elif 99 <= a <= 100:
        return "F"
    elif 1 < a < 99:
        return f"{a}%"
    else:
        raise ValueError("Percentage out of bounds")


if __name__ == "__main__":
    main()
