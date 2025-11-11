package com.example.basic

data class Jedi (
    val nombre: String,
    val edad: Int,
    val nivelFuerza: Int,
    val maestro: String?= null,
) {
    val ragro: String
        get() = when {
            nivelFuerza >= 90 -> "maestro"
            nivelFuerza >= 70 -> "caballero"
            nivelFuerza >= 50 -> "Pandawan"
            else -> {
                "iniciado"
            }
        }

    fun puedeEnseniar(): Boolean = nivelFuerza >= 70
    fun entrenar(): Boolean = edad <= 5

}
fun main (){
    val luke = Jedi( nombre="Anakin Skywalker",
        edad = 25,
        nivelFuerza = 75,
        maestro = "Obiwan kenobi")
    println(luke)
    // descentralizacion de un objeto
    val (nombre,edad,nivelFuerza,maestro) = luke
    println("Nombre del Jedi ${nombre}, edad: ${edad}, nivel de fuerza: ${nivelFuerza}")
// copiar objetos
    val ashoka = luke.copy(nombre = "ahsoka", nivelFuerza =80)
    println(ashoka)
    //propiedades calculada
    println("rango de ashoka: ${ashoka.ragro}")
    println("ashoca puede enseniar ${ashoka.puedeEnseniar()}")

}