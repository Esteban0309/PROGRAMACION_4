package com.example.basics

fun main(){
    print("Ingrese un numero: ")
    val numero = readLine()!!.toInt()

    println("Tabla del $numero:")
    for (i in 1..10) {
        println("$numero x $i = ${numero * i}")
    }
}