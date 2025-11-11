package com.example.kotlin

fun main() {


    println("escoje un color: rojo, amarillo, verde")
    val color = readln().lowercase()

    print("el peaton presion el boton? (si/no): ")
    val boton = readln().lowercase()


    if (color == "verde" && boton == "si") {
        println("espera a rojo")
    } else if (color == "rojo") {
        println("cruza")
    } else if (color == "amarillo") {
        println("prepárate")
    } else {
        println("espera")
    }
}