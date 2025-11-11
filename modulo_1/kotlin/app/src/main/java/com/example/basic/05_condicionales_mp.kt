package com.example.kotlin

fun main() {
    println("¡Estructuras de Control!")
    println("¡Condicionales en Admision!")

    val nota1 = 8
    val nota2 = 9

    if (nota1 > nota2) {
        println("La nota más alta es $nota1")
    } else {
        println("La nota más alta es $nota2")
    }

    println("Evaluacion según promedio final")
    var promedio: Int = 9

    if (promedio >= 9) {
        println("Admitido con excelencia academica")
    } else if (promedio >= 7) {
        println("Admitido")
    } else {
        println("No cumple los requisitos de admisión")
    }
}
