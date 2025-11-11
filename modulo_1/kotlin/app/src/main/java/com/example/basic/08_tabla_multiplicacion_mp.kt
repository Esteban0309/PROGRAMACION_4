package com.example.basics

fun main() {
    print("Ingrese la nota del estudiante: ")
    val nota = readLine()!!.toInt()

    println("Proyección de mejora para la nota $nota:")
    for (i in 1..10) {
        println("Si mejora un $i%, la nueva nota sería: ${nota + (nota * i / 100)}")
    }
}