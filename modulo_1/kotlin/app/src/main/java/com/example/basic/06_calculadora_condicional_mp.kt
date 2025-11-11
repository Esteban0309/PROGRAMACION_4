package com.example.basics

fun main() {
    println("¡Calculadora de Promedios de Admisión!")
    println("Ingrese la nota del examen académico:")
    val notaExamen: Int = readLine()?.toIntOrNull() ?: 0
    println("Ingrese la nota de la entrevista:")
    val notaEntrevista: Int = readLine()?.toIntOrNull() ?: 0

    println("Seleccione una operación:")
    println("1. Sumar notas (total)")
    println("2. Restar notas (comparar)")
    println("3. Multiplicar (ponderación simulada)")
    println("4. Dividir (promedio simple)")
    val operacion: Int = readLine()?.toIntOrNull() ?: 0

    when (operacion) {
        1 -> println("Suma total: ${notaExamen + notaEntrevista}")
        2 -> println("Diferencia entre notas: ${notaExamen - notaEntrevista}")
        3 -> println("Resultado de multiplicación: ${notaExamen * notaEntrevista}")
        4 -> {
            if (notaEntrevista != 0) {
                println("Promedio simple: ${(notaExamen + notaEntrevista) / 2}")
            } else {
                println("No se puede dividir entre cero")
            }
        }

        else -> println("Opción no válida")
    }
}
