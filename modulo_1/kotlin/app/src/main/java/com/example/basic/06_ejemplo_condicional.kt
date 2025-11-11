package com.example.basics

fun main() {
    println("¡Sistema de Becas!")

    print("Ingrese su promedio: ")
    val promedio: Int = readLine()?.toIntOrNull() ?: 0

    print("¿Usted trabaja? (si / no): ")
    val trabaja: String = readLine()?.lowercase() ?: "no"

    if (promedio >= 90 && trabaja == "no") {
        println("Usted tiene derecho a una BECA COMPLETA.")
    } else if (promedio >= 90 && trabaja == "si") {
        println("Usted tiene derecho a una BECA PARCIAL.")
    } else {
        println("Usted no califica para una beca.")
    }
}