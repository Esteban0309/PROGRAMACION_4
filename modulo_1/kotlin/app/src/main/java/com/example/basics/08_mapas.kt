package com.example.basics

fun main() {
    println("Mapas")

    val fuerzaJedis = mapOf(
        "Luke" to 85,
        "Leia" to 80,
        "Obi-Wan" to 95,
        "Yoda" to 100
    )
    println("Fuerza de los Jedis: ${fuerzaJedis}")

    println("Mapa mutables")

    val misionesCompletadas= mutableMapOf<String, Int>()
    misionesCompletadas ["Luke"] = 15
    misionesCompletadas ["Leia"] = 12
    misionesCompletadas ["Han"] = 20

    println("Misiones : ${misionesCompletadas}")

    for((jedi, fuerza) in fuerzaJedis) {
        println("$jedi tiene nivel de fuerza $fuerza")
    }

    val planetasVisitados = setOf("Tatooine", "Corusent", "Dagobah")
    println("Planetas visitados : ${planetasVisitados}")

    val planetasPeligrosos = setOf("Mustefer", "Corusent", "Korriban")
    println("Planetas visitados : ${planetasPeligrosos}")

    println("Operaciones de Conjuntos")
    val interseccion = planetasPeligrosos intersect planetasVisitados
    val union = planetasPeligrosos union  planetasVisitados
    val diferencia = planetasPeligrosos - planetasVisitados
    println("Planetas Visitados y peligrosos: ${interseccion}")
    println("Todos los Planetas: ${union}")
    println("Planetas Seguros visitados: ${diferencia}")


//el alumno ingresa una hora 0-23
//si esta entre 7y13 "Clase en la mañana"
//si esta entre 14y19 "Clase en la tarde"
//otro caso "horario lectivo"
    println("Validad Horario de clases")

    print("Ingresa la hora (0-23): ")
    val horaTexto = readLine()

    if (horaTexto.isNullOrEmpty()) {
        println("No ingresaste ninguna hora")
        return
    }

    val hora = horaTexto.toIntOrNull()
    if (hora == null || hora !in 0..23) {
        println("Hora inválida, debe estar entre 0 y 23")
        return
    }

    val mensaje = when (hora) {
        in 7..13 -> "Clase en la mañana"
        in 14..19 -> "Clase en la tarde"
        else -> "Horario lectivo"
    }

    println(mensaje)


}
