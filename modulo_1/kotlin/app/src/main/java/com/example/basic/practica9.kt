package com.example.basic

fun main() {
    print("ingresa un numero para ver su tabla de multiplicar: ")
    val numero = readln().toInt()

    println("tabla del $numero:")

    for (i in 1..10) {
        println("$numero x $i = ${numero * i}")
    }
}
