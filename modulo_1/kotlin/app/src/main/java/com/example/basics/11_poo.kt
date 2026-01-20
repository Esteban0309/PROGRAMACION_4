package com.example.basics

data class Jedi(
    val nombre: String,
    val edad: Int,
    val nivelFuerza: Int,
    val maestro: String? = null
) {
    val rango: String
        get() = when {
            nivelFuerza >= 90 -> "Maestro"
            nivelFuerza >= 70 -> "Caballero"
            nivelFuerza >= 50 -> "Padawan"
            else -> "Iniciado"
        }

    fun puedeEnseñar(): Boolean = nivelFuerza >= 70
    fun entrenar(): Boolean = edad <= 5
}

fun main() {
    val luke = Jedi(
        nombre = "Anakin Skywalker",
        edad = 25,
        nivelFuerza = 75,
        maestro = "Obi-Wan Kenobi"
    )
    println(luke)
    //Descentralizacion de un objeto
    val(nombre,edad,nivelFuerza) = luke
    println("Nombre del Jedi ${nombre}, edad:${edad}, nivel de la fuerza: ${nivelFuerza}")
    //copiar objetos
    val ashoka = luke.copy(nombre= "ashoka", nivelFuerza=80)
    println(ashoka)
    //propiedades calculada
    println("Rango de ashoka ${ashoka.rango}")

    println("ashoka puede eneseniar ${ashoka.puedeEnseñar()}")
}

