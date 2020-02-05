#Libreria SYS
# ----------------------
import sys
print(sys.platform)
print(sys.version)

# cuando ejecutas desde CLI: > python test1.py arg1 arg2 ....
print('args are: {} and length is: {}'.format(sys.argv, len(sys.argv)))
for i in range(len(sys.argv)):
    print(sys.argv[i])

print(sys.maxsize) # max size de un integer
print(sys.version)

#Libreria OS
# ----------------------
import os
try:
    os.mkdir("testabc") #crear un directorio
except OSError as e:
    print('Error {}, {}'.format(e.errno, e.strerror))

if os.path.exists('testabc'):
    print('Ya existe')
else:
    print('No existe')

print(os.listdir())

#Libreria Math
# ----------------------
import math
print(math.pi)
print(math.e) #Euler's number
print(math.factorial(4)) #4*3*2*1
f = int(input("Introducir un valor"))
print('Factorial es {}'.format(math.factorial(f)))
print(math.isclose(1.3, 1.4, abs_tol = 0.25))
print(math.isclose(3,3))


#Libreria Random
# ----------------------
import random
print(random.random())
print(random.choice([12, 15, 18, 20]))
print(random.choice(['a', 'b', 'c', 'd']))

#Libreria Statistics
# ----------------------
import statistics
print(statistics.mean([10, 14, 3, 15, 20, 3, 19]))
print(statistics.median([10, 14, 3, 15, 20, 3, 19]))
print(statistics.mode([10, 14, 3, 15, 20, 3, 19]))
print(statistics.stdev([10, 14, 3, 15, 20, 3, 19]))