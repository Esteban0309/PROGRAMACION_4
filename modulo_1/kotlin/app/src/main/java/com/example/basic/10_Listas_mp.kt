package com.example.basic

fun main() {
    println("Listas - Sistema de Admisión del Instituto")

    val inmutableLista: List<Int> = listOf(101, 102, 103)
    println("Lista inmutable de aspirantes: ${inmutableLista}")

    val mutableLista: MutableList<Int> = mutableListOf(80, 85, 90)
    println("Lista mutable de puntajes: ${mutableLista}")
    mutableLista.add(95)
    println("Puntajes actualizados: ${mutableLista}")
    mutableLista.removeAt(index = 0)
    println("Lista de puntajes tras eliminar el primero: ${mutableLista}")

    for (mutable in mutableLista) println("Puntaje registrado: $mutable")
    println("Operaciones con lista mutable - Áreas académicas")

    val colores = mutableListOf("Administración", "Software")
    colores.add("Diseño Gráfico")
    colores += "Marketing"
    colores.add(index = 1, element = "Contabilidad")
    println("Carreras disponibles: ${colores}")
    colores.remove(element = "Software")
    println("Carreras tras eliminación: ${colores}")
    colores.removeAt(index = 0)
    println("Carreras actualizadas: ${colores}")
    colores[0] = "Ingeniería Industrial"
    println("Carrera modificada: ${colores}")
    colores.clear()
    println("¿Hay carreras registradas?: ${colores.isEmpty()}")

    println("Búsquedas con lista mutable - Estudiantes admitidos")
    val nombres = mutableListOf("Juan", "Luis", "Pedro")
    println("Primer nombre que empieza con L: ${nombres.find { it.startsWith(prefix = "L") }}")
    println("Primer nombre con más de 4 letras: ${nombres.firstOrNull { it.length > 4 }}")
    println("¿Algún nombre contiene 'p'?: ${nombres.any { it.contains(char = 'p') }}")
    println("¿Ningún estudiante llamado 'X'?: ${nombres.none { it == "X" }}")

    println("Ordenamiento con lista mutable - Resultados de admisión")
    val numerosDessordemados = mutableListOf(58, 73, 64, 91, 85, 70, 79, 60, 88)
    println("Puntajes en orden ascendente: ${numerosDessordemados.sorted()}")
    println("Puntajes en orden descendente: ${numerosDessordemados.sortedDescending()}")
    println("Puntajes sin duplicados: ${numerosDessordemados.distinct()}")
}