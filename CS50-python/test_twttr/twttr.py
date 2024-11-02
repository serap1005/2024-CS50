
def main():
    sentence=input("Input: ")
    print("Output:", shorten(sentence))

def shorten(sentence):
    vowels = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
    output = ""
    for element in sentence:
        if element not in vowels:
            output += element
    return output

if __name__ == "__main__":
    main()

