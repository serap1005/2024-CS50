monthlist=[
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
]
def is_valid_date(month, day, year):
    if not (1 <= month <= 12):
        return False
    if not (1 <= day <= 31):
        return False
    if not (1 <= year <= 9999):
        return False
    return True

while True:
    try:
        date = input("Date: ").strip()

        if "/" in date:
            parts = date.split("/")
            if len(parts) == 3:
                month = int(parts[0])
                day = int(parts[1])
                year = int(parts[2])
            if is_valid_date(month, day, year):
                print(f"{year}-{month:02d}-{day:02d}")
                break
            else:
                False

        elif "," in date:
            parts = date.split(" ")
            if len(parts) == 3:
                month_name = parts[0]
                if month_name in monthlist:
                    month = monthlist.index(month_name) + 1
                    day = int(parts[1].rstrip(","))
                    year = int(parts[2])
                    if is_valid_date(month, day, year):
                        print(f"{year}-{month:02d}-{day:02d}")
                        break
                else:
                    False
    except ValueError:
        False

