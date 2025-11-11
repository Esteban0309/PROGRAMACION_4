package com.example.basic

fun main() {
    print("ingresa un texto: ")
    val texto = readln().lowercase() //
    var contador = 0

    for (letra in texto) {
        if (letra in "aeiou") {
            contador++
        }
    }

    println("el numero de vocales es: $contador")
}