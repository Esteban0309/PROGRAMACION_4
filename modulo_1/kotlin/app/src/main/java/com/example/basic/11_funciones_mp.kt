package com.example.basic

import kotlinx.coroutines.processNextEventInCurrentThread

// Función con expresión simple (Single-expression function)
// Calcula el cuadrado de la calificación del aspirante
fun calificacionCuadrado(puntaje: Int) = puntaje * puntaje

// Función con retorno múltiple
// Devuelve la suma y resta de las notas del examen teórico y práctico
fun calcularNotas(teorico: Int, practico: Int): Pair<Int, Int> {
    val suma = teorico + practico
    val resta = teorico - practico
    return Pair(suma, resta)
}


fun main() {
    saludar()

    val resultado = sumar(a = 80, b = 90)
    println("Total de puntos obtenidos: $resultado")
    println("Calificación al cuadrado: ${calificacionCuadrado(puntaje = 9)}")
    println("Resumen de notas (suma, diferencia): ${calcularNotas(teorico = 85, practico = 75)}")

    // Función lambda: cálculo rápido de cuadrado
    val cuadradoLambda = { x: Int -> x * x }
    val saludoLambda = { nombre: String -> "Buenos días, aspirante $nombre" }
    println("Calificación al cuadrado (lambda): ${cuadradoLambda(10)}")
    println(saludoLambda("María López"))
}
