package com.example.kotlin

fun main() {

    println("Ingresa tu edad: ")
    val edad = readln().toInt()

    if (edad >= 16){
        println("Ya puedes votar")
    }else{
        println("aun no cumple la edad ")
    }

}