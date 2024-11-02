

list={}
while True:
    try:
        item=input().upper().strip()
        if item=="":
            break
        if item in list:
             list[item]+=1
        else:
             list[item]=1
    except EOFError:
        break
sorted_items = sorted(list.items())

for item, count in sorted_items:
    print(f"{count} {item}")
