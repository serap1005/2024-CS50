menu= {
    "Baja Taco": 4.25,
    "Burrito": 7.50,
    "Bowl": 8.50,
    "Nachos": 11.00,
    "Quesadilla": 8.50,
    "Super Burrito": 8.50,
    "Super Quesadilla": 9.50,
    "Taco": 3.00,
    "Tortilla Salad": 8.00
}
lowercase_menu = {key.lower(): value for key, value in menu.items()}
countprice=[]

while True:
    try:
        item=input("Item: ").strip().lower()
        if item in lowercase_menu:
            price=(lowercase_menu[item])
            countprice.append(price)
            total=sum(countprice)
            print(f"Total: ${total:.2f}")
    except EOFError:
        print()
        break

