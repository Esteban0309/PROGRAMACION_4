package com.example.basic

fun main() {
    var sumaNotas = 0.0

    for (i in 1..3) {
        print("ingresa la nota $i (0 a 20): ")
        var nota = readln().toDouble()

        // Validar que la nota esté entre 0 y 20
        while (nota !in 0.0..20.0) {
            print("nota invalida, ingresa nuevamente la nota $i (0 a 20): ")
            nota = readln().toDouble()
        }

        sumaNotas += nota
    }

    val promedio = sumaNotas / 3

    println("promedio: $promedio")

    if (promedio >= 14) {
        println("aprobado")
    } else {
        println("reprobado")
    }
}