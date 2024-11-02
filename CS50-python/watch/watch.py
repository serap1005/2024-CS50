
import re

def main():
    print(parse(input("HTML: ")))

def parse(s):
     if link := re.search(r"\"https?://(?:www\.)?youtube\.com/embed/(\w+)\"",s):
        return('https://youtu.be/'+link.group(1))

if __name__ == "__main__":
    main()




