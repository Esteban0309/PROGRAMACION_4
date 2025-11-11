package com.example.basic

fun main() {
    print("ingresa tu contrasena: ")
    val contrasena = readln()

    val tieneLongitud = contrasena.length >= 8
    val tieneDigito = contrasena.any { it.isDigit() }

    if (tieneLongitud && tieneDigito) {
        println("Contrasena valida")
    } else {
        println("contrasena invalida: debe tener al menos 8 caracteres y un número")
    }
}
