
def main():
    c=input("camelCase: ").strip()
    print("snake_case :", end="")
    print(convert(c))

def convert(text:str):
    new_text = text[0].lower()
    for i in text[1:]:
        if i.isupper():
            new_text += "_" + i.lower()

        else:
            new_text+=i


    return new_text
main()


