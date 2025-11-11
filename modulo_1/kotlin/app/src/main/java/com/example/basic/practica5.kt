package com.example.basic

fun main() {
    print("Ingresa la temperatura en °C: ")
    val temp = readln().toDouble()

    if (temp <= 0) {
        println("solido")
    } else if (temp in 1.0..99.0) {
        println("liquido")
    } else if (temp >= 100) {
        println("gas")
    } else {
        println("valor no valido")
    }
}
