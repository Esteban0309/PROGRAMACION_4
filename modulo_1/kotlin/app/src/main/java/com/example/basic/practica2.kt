package com.example.basic

fun main() {
    print("Ingresa tu edad: ")
    val edad = readln().toInt()

    val precio = if (edad < 12) {
        println("El precio de tu entrada es:$3")
    } else if (edad >= 65) {
        println("El precio de tu entrada es: $4")
    } else {
        println("El precio de tu entrada es: $5")
    }

}