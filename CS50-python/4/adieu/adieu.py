import inflect

p = inflect.engine()
name_list=[]
while True:
    try:
        name=input("Name: ")
        name_list.append(name)
    except EOFError:
        print("")
        break

mylist = p.join((name_list))
print("Adieu, adieu, to "+mylist)


