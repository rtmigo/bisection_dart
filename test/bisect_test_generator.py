from bisect import bisect_right, bisect_left

A = [0, 1, 2, 2, 2, 2, 3, 3, 5, 6]

print()
print(f"final lst={A};")
for x in range(-2, 9):
    print(f"expect(bisect_right(lst, {x}), {bisect_right(A, x)});")

print()
print(f"final lst={A};")

for x in range(-2, 9):
    print(f"expect(bisect_left(lst, {x}), {bisect_left(A, x)});")

    #print("bisect_right(A,x)")

################################################################################

def index(a, x):
    'Locate the leftmost value exactly equal to x'
    i = bisect_left(a, x)
    if i != len(a) and a[i] == x:
        return i
    return None

def find_lt(a, x):
    'Find rightmost value less than x'
    i = bisect_left(a, x)
    if i:
        return a[i-1]
    return None

def find_le(a, x):
    'Find rightmost value less than or equal to x'
    i = bisect_right(a, x)
    if i:
        return a[i-1]
    return None

def find_gt(a, x):
    'Find leftmost value greater than x'
    i = bisect_right(a, x)
    if i != len(a):
        return a[i]
    return None

def find_ge(a, x):
    'Find leftmost item greater than or equal to x'
    i = bisect_left(a, x)
    if i != len(a):
        return a[i]
    return None

########################################################################################################################

print()
print(f"final lst={A};")

for x in range(-2, 9):
    res = index(A, x)
    print(f"expect(index<num>(lst, {x}, dontPanic:true), {res if res is not None else 'null'});")

print()
print(f"final lst={A};")

for x in range(-2, 9):
    res = find_lt(A, x)
    print(f"expect(find_lt<num>(lst, {x}, dontPanic:true), {res if res is not None else 'null'});")

print()
print(f"final lst={A};")

for x in range(-2, 9):
    res = find_le(A, x)
    print(f"expect(find_le<num>(lst, {x}, dontPanic:true), {res if res is not None else 'null'});")

print()
print(f"final lst={A};")

for x in range(-2, 9):
    res = find_gt(A, x)
    print(f"expect(find_gt<num>(lst, {x}, dontPanic:true), {res if res is not None else 'null'});")

print()
print(f"final lst={A};")

for x in range(-2, 9):
    res = find_ge(A, x)
    print(f"expect(find_ge<num>(lst, {x}, dontPanic:true), {res if res is not None else 'null'});")
