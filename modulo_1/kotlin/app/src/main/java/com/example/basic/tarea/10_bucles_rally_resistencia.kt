package com.example.basic

import kotlin.random.Random

fun main() {
    var energia = 100
    println("Rally de Resistencia")
    print("Ingrese el número de etapas: ")
    val etapas = readln().toIntOrNull() ?: 0

    for (etapa in 1..etapas) {
        val terreno = Random.nextInt(1, 4) // 1, 2 o 3
        val perdida = when (terreno) {
            1 -> 5   // asfalto
            2 -> 10  // tierra
            3 -> 15  // barro
            else -> 0
        }

        energia -= perdida
        println("Etapa $etapa - Terreno: ${
            when (terreno) {
                1 -> "Asfalto"
                2 -> "Tierra"
                3 -> "Barro"
                else -> "Desconocido"
            }
        } | Energía actual: $energia")

        if (energia <= 0) {
            println("Abandona en la etapa $etapa. Energía agotada.")
            return
        }
    }

    println("Rally completado con energía restante: $energia")
}