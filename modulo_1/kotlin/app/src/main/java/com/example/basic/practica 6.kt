package com.example.basic

fun main() {
    var opcion: Int
    do {
        println("calculadora minima")
        println("1 sumar")
        println("2 restar")
        println("3 salir")
        print("elige una opcion: ")
        opcion = readln().toInt()

        when (opcion) {
            1 -> {
                print("ingresa el primer numero: ")
                val a = readln().toDouble()
                print("igresa el segundo numero: ")
                val b = readln().toDouble()
                val suma = a + b
                println("resultado: $suma")
            }
            2 -> {
                print("ingresa el primer numero: ")
                val a = readln().toDouble()
                print("ingresa el segundo numero: ")
                val b = readln().toDouble()
                val resta = a - b
                println("resultado: $resta")
            }
            3 -> println("saliendo de la calculadora")
            else -> println("opcion no valida")
        }

    } while (opcion != 3)
}
