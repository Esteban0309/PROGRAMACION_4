package com.example.rentacar

fun main() {
    println("Sistema de Alquiler de Vehículos")

    val edad: Int = 25
    val tieneLicencia: Boolean = true
    val aniosExperiencia: Int = 2

    val puedeAlquilar = edad >= 21 && tieneLicencia && aniosExperiencia >= 1
    val necesitaRevisionAdicional = !tieneLicencia || aniosExperiencia < 1

    println("¿Puede alquilar un vehículo? : $puedeAlquilar")
    println("¿Necesita revisión adicional? : $necesitaRevisionAdicional")
}
