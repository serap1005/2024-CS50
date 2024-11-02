due=50
while due>0:
    insert=int(input("Insert Coin: "))

    if insert in [25,10,5]:
        due=due-insert
        if due>0:
            print(f"Amount Due: {due}")
        else:
            print("Change Owed:",abs(due))
    else:
        print(f"Amount Due: {due}")






