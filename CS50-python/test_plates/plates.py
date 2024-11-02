def main():
    plate = input("Plate: ")

    if is_valid(plate):
        print("Valid")
    else:
        print("Invalid")

def is_valid(s):
    if not (2 <= len(s) <= 6):
        return False
    elif not (s[0].isalpha() and s[1].isalpha()):
        return False

    for i in range(len(s)):
        if s[i].isdigit():
            if i == len(s) - 2 and s[i] == '0':
                return False
            elif not (i == len(s) - 1 or i == len(s) - 2):
                return False
    return True


if __name__ == "__main__":
    main()
