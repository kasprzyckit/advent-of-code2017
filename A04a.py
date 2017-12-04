import sys
import numpy as np

def main():
    count = 0
    co = 0
    file1 = open("04.txt", "r")
    lines = file1.readlines()
    for c in lines:
        c = c[:-1]
        words = c.split(' ')
        D = []
        flag = True
        for word in words:
            if word in D:
                flag = False
                co += 1
                print(c)
                print(co)
                break
            else:
                D.append(word)
        if flag: count += 1
    print(count)
    file1.close()

if __name__ == '__main__':
    main()