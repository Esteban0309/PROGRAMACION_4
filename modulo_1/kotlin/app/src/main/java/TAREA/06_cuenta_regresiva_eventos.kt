package com.example.TAREA

fun main() {
    println("Iniciando cuenta regresiva...")

    for (i in 30 downTo 0) {
        when (i) {
            20 -> println("[$i] chequeo de sistemas")
            10 -> println("[$i] ultimos ajustes")
            0 -> println("[$i] despegue")
            else -> println(i)
        }
    }
}