package com.example.basics

fun main() {
    println("¡Bucles en el Proceso de Admisión!")

    // Lista de aspirantes
    val aspirantes = listOf("María", "Carlos", "Lucía", "Andrés", "Sofía")

    // Recorrer la lista con índices
    for ((index, aspirante) in aspirantes.withIndex()) {
        println("${index + 1}. $aspirante")
    }

    // Rangos de paso: simulando revisión de expedientes cada 2 aspirantes
    for (i in 0..20 step 2) {
        println("Revisando expediente número: $i")
    }

    // Rangos descendentes: simulando cuenta regresiva para cierre de inscripciones
    for (countdown in 10 downTo 1) {
        println("Cierre de inscripciones en: $countdown días")
    }

    // Control de flujo en el proceso de revisión
    for (aspirante in aspirantes) {
        if (aspirante == "Lucía") continue // saltar a la siguiente revisión
        if (aspirante == "Andrés") break // detener el proceso en cierto punto
        println("Revisando documentos de $aspirante")
    }
}
