package com.example.basic

fun main() {
    println("Mapas en el Proceso de Admisión")

    val puntajeAspirantes = mapOf(
        "María" to 85,
        "Carlos" to 78,
        "Lucía" to 92,
        "Andrés" to 95
    )
    println("Puntajes de los aspirantes: $puntajeAspirantes")

    println("Mapa mutable (documentos entregados)")
    val documentosEntregados = mutableMapOf<String, Int>()
    documentosEntregados["María"] = 5
    documentosEntregados["Carlos"] = 4
    documentosEntregados.put("Lucía", 6)

    println("Documentos entregados: $documentosEntregados")

    for ((aspirante, puntaje) in puntajeAspirantes) {
        println("$aspirante obtuvo un puntaje de $puntaje puntos")
    }

    val carrerasElegidas = setOf("Software", "Diseño", "Marketing")
    println("Carreras elegidas: $carrerasElegidas")

    val carrerasDisponibles = setOf("Software", "Administración", "Marketing", "Turismo")
    println("Carreras disponibles: $carrerasDisponibles")

    println("Operaciones de conjuntos:")
    val interseccion = carrerasDisponibles intersect carrerasElegidas
    val union = carrerasDisponibles union carrerasElegidas
    val diferencia = carrerasDisponibles - carrerasElegidas

    println("Carreras elegidas y disponibles: $interseccion")
    println("Todas las carreras posibles: $union")
    println("Carreras disponibles no elegidas: $diferencia")
}
