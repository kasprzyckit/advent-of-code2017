import sys
import numpy as np

def cond(x, y, oper):
    return {
        "==": x == y,
        "!=": x != y,
        '>': x > y,
        ">=": x >= y,
        '<': x < y,
        "<=": x <= y
    }.get(oper, False)

def main():
    file1 = open("08.txt", "r")
    lines = file1.readlines()
    D = {}
    maxv = 0
    for c in lines:
        c = c[:-1]
        words = c.split(' ')
        if words[0] not in D: D[words[0]] = 0
        if words[4] not in D: D[words[4]] = 0
        if cond(D[words[4]], int(words[6]), words[5]):
            if words[1] == "inc": D[words[0]] += int(words[2])
            else: D[words[0]] -= int(words[2])
        if D[words[0]] > maxv: maxv = D[words[0]]
    file1.close()
    print(maxv)

if __name__ == '__main__':
    main()