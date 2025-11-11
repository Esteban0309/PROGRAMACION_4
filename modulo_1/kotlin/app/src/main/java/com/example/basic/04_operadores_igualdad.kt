package com.example.kotlin

fun main() {
    println("!Operadores Igualdad!!!")
    val nombre1: String = "Yoda"
    val nombre2: String = "Yoda"
    val nombre3: String = String("Yoda".toCharArray())

    println("Igualdad estructural (contenido)")
    println(nombre1==nombre2)
    println(nombre1==nombre3)
    println("Igualdad Referencial (misma intancia)")
    println(nombre1==nombre2)
    println(nombre1==nombre3)
    //hacer un calculo que corresponda a mi tema
}