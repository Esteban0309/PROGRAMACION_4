package com.example.alquilervehiculos

fun procesarAlquiler(dias: Int) {
    try {
        if (dias <= 0) {
            throw IllegalArgumentException("El número de días debe ser mayor que cero.")
        }
        val precioPorDia = 50.0
        val total = dias * precioPorDia
        println("El precio total del alquiler es: $$total")
    } catch (e: IllegalArgumentException) {
        println("Error: ${e.message}")
    }
}

fun main() {
    val diasAlquiler = -3
    procesarAlquiler(diasAlquiler)
}
