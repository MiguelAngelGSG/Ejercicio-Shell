#!/bin/bash

#Ejercicio 1

#Obtener usuario actual
current_user=$(whoami)


#Comprueba si el usuario actual puede utilizar comandos como root sin contraseña
# 2>/dev/null elimina posibles mensajes de error
#Los comandos 'sudo' solo pueden ser utilizados por el 'super user'
#-n dice a la maquina que no nos pida contraseña
#Este codigo trata de usar 'sudo' sin contraseña, si no devuelve 'true' no tienes acceso root
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

#-eq compara ambas Variables para ver si son iguales
#gt (greater than) compara si la primera Variable es mayor que la segunda

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