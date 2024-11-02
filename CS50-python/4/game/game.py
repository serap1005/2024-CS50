import random
import sys



while True:
    try:
        max=input("Level: ")
        max_int=int(max)
        if max_int>0:
            ans=random.randint(1,max_int)
            while True:
                guess=input("Guess: ")
                try:
                    guess_int=int(guess)
                    if guess_int<ans:
                        print("Too small!")
                        False
                    elif guess_int>ans:
                        print("Too large!")
                        False
                    elif guess_int==ans:
                        print("Just right!")
                        sys.exit()
                except ValueError:
                    False
    except ValueError:
        False






