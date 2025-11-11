package com.example.kotlin

fun main() {
    println("Ingrese la temperatura actual (°C):")
    val  temperatura = readln().toInt()

    println("Ingrese su preferencia frio, templado o caliente:")
    val  preferencia = readln().lowercase()

    val resultado =
    if (preferencia == "frio" && temperatura > 22) {
        "Encender aire"
    } else if (preferencia == "caliente" && temperatura < 18) {
        "Encender calefaccion"
    } else if (preferencia == "templado" && temperatura in 18..22){
        "En confort"
    } else{
        "Ventilar"
    }
    println("Resultado: $resultado")
}