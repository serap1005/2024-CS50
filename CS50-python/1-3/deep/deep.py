x=input("What is the Answer to the Great Question of Life, the Universe, and Everything? ")
x=x.strip().lower()

if x in ["42", "forty-two", "forty two"]:
    print ("Yes")
else:
    print ("No")
