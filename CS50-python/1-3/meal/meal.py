def main():
    time=input("What time is it? ").rstrip("a.m.").rstrip("p.m.").strip()
    time=convert(time)
    if time<=8 and time>=7:
        print("breakfast time")
    elif time<=13 and time>=12:
        print("lunch time")
    elif time<=19 and time>=18:
        print("dinner time")


def convert(time):
    hour,min=time.split(":")
    hour=float(hour)
    min=float(min)/60
    return hour+min


if __name__ == "__main__":
    main()
