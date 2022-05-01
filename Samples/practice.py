def smallest(a):
    smallest = a[0]
    for elem in a:
        if elem < smallest:
            smallest = elem

    return smallest


def fizzBuzz(n):
    for i in range(1, n+1):
        if i%5 == 0 and i%3==0:
            print(i, "FizzBuzz")
        elif i%3==0:
            print(i, "Fizz")
        elif i%5==0:
            print(i, "Buzz")


# =============================
tableau = [1,2,3,-5, 4,5,6,44,0,2,4,5]
print(smallest(tableau))
fizzBuzz(30)
