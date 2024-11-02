
import emoji

text= input("Input: ").strip()
output= emoji.emojize(text, language='alias') 
print(f"Output: {output}")
