package com.example.basics

fun main() {
    println("!calculadora!!!")
    println("!Incluir el primer valor!!!")
    val value1: Int = readLine()?.toIntOrNull() ?: 0
    println("!Incluir el segundo valor!!!")
    val value2: Int = readLine()?.toIntOrNull() ?: 0
    println("1 suma, 2 resta, 3 multiplicacion, 4 division")
    val operacion: Int = readLine()?.toIntOrNull() ?: 0

    when (operacion) {
        1 -> println("suma : ${value1 + value2}")
        2 -> println("resta : ${value1 - value2}")
        3 -> println("multiplicacion : ${value1 * value2}")
        4 -> println("division : ${value1 / value2}")
        else -> println("opcion no válida")
    }
}
