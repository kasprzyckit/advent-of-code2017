import sys
import numpy as np
    

def main():
    digits = []
    with open("01.txt") as f:
      while True:
        c = f.read(1)
        if not c: break
        digits.append(ord(c) - ord('0'))
    suma = 0
    for i in range(len(digits)):
        if digits[i] == digits[int(int((len(digits)/2 + i))%len(digits))]: suma += digits[i]
    print(suma)

if __name__ == '__main__':
    main()