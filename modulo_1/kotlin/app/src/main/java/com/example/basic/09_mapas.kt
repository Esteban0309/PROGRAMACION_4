package com.example.basic

fun main() {
    println("Mapas")

    val fuerzaJedis= mapOf(
        "luke" to 85,
        "Leia" to 80,
        "obi-Wan" to 95,
        "yoda" to 100
    )
    println("Fuerza de los Jedis: ${fuerzaJedis}")

    println("mapa mutable")
    val misionescompletas = mutableMapOf<String, Int>()
    misionescompletas ["luke"]=15
    misionescompletas ["Leia"]=15
    misionescompletas.put("Han",20)

    println("Misiones: ${misionescompletas}")

    for((jedi,fuerza)in fuerzaJedis){
        println("$jedi tiene nivel de fuerza $fuerza")
    }
    val planetasVisitados= setOf("Tatooine","Coruscant","Dragobad")
    println("Panetas visitados: ${planetasVisitados}")

    val planetaspeligrosos = setOf("Mustafar", "Coruscant", "Karriban")
    println("Panetas peligrosos : ${planetaspeligrosos}")

    println("operaciones de conjuntos")
    val interseccion = planetaspeligrosos intersect planetasVisitados
    val union= planetaspeligrosos union planetasVisitados
    val diferencia = planetaspeligrosos - planetasVisitados
    println("planetas visitados y peligrosos : ${interseccion}")
    println("Todos los planetas : ${union}")
    println("planetas seguros visitados: ${diferencia}")
}
