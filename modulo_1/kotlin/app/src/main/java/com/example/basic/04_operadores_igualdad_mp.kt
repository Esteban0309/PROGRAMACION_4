package com.example.kotlin

fun main() {
    println("¡Operadores de Igualdad en Admisión!")

    val estudiante1: String = "María López"
    val estudiante2: String = "María López"
    val estudiante3: String = String("María López".toCharArray())

    println("Igualdad estructural (mismo contenido)")
    println(estudiante1 == estudiante2)
    println(estudiante1 == estudiante3)

    println("Igualdad referencial (misma instancia en memoria)")
    println(estudiante1 === estudiante2)
    println(estudiante1 === estudiante3)
}