package com.example.TAREA

fun main() {
    print("Ingrese un texto: ")
    val texto = readln().trim().lowercase()

    val vocales = "aeiouAEIOU"
    var contador = 0

    for (i in 0 until texto.length - 1) {
        val actual = texto[i]
        val siguiente = texto[i + 1]
        if (actual in vocales && siguiente in vocales) {
            contador++
        }
    }

    println("El texto contiene $contador pares de vocales consecutivas.")
}