from random import randint
acumulado = 0
for i in range(64):
    a = randint(0, 255)
    b = randint(0, 255)
    parcial = (a-b)**2
    print(f"{a:020b}", f"{b:020b}")
    acumulado += parcial
print(f"{acumulado:020b}")