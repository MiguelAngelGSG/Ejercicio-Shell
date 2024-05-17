#!/bin/bash

#Ejercicio 1

# Obtain current user
current_user=$(whoami)


# Check if the current user can run commands as root without a password prompt
# 2>/dev/null suppresses error messages
# sudo commands are only usable by the super user
# -n asks to not be prompt a password
# this code will try to have access to sudo without using a password, if it doesn't return true you don't have root access
if sudo -n true 2>/dev/null; then
    echo "El usuario '$current_user' tiene acceso a root."
else
    echo "El usuario '$current_user' no tiene acceso a root."
fi

sleep 1

# Ejercicio 2

#Primer INTEGER
echo "Elige el primer número para comparar"
read firstNumber

#El comando dentro de los brackets se asegura que el valor introducido sea un INTEGER, la exclamacion fuera de los brackets invierte su funcion.
if ! [[ $firstNumber =~ ^[0-9]+$ ]]; then
    echo "El valor introducido no es un número."
    exit
fi

#Segundo INTEGER
echo "Elige otro número"
read secondNumber

if ! [[ $secondNumber =~ ^[0-9]+$ ]]; then
    echo "El valor introducido no es un número."
    exit
fi

# -eq compara ambas Variables para ver si son iguales
# gt (greater than) compara si la primera Variable es mayor que la segunda

if [ $firstNumber -eq $secondNumber ]; then
    echo "Los números son iguales."
elif [ $firstNumber -gt $secondNumber ]; then
    echo "$firstNumber es mayor que $secondNumber"
else
    echo "$firstNumber es menor que $secondNumber"
fi


sleep 1


#Ejercicio 3

echo "Averiguemos si un numero es divisible por 2, elige un número: "
read divisibleNumber


#%2 calcula el numero restante al dividir tu número entre 2, entonces "-eq 0"compara el resultado a 0 para determinar si es par o impar
if [ $((divisibleNumber%2)) -eq 0 ]; then
    echo "$divisibleNumber es par"
else
    echo "$divisibleNumber es impar"
fi