//El usuario ingresa su promedio y si trabaja (si/no)
//Promedio >=90 y No trabaja -> Beca completa
//Promedio >=90 trabaja -> Beca parcial
//Promedio <90 -> Sin Beca


package com.example.basics

fun main() {
    println("SIstema de becas")
    println("Condicional")

    println("Ingresa tu promedio: ")
    val promedio = readLine()!!.toDouble()

    println("Trabaja? Si/No: ")
    val trabaja = readLine()!!.lowercase()

    println("Este es el resultado de becas: ")

    if (promedio >= 90 && trabaja == "no"){
        println("Beca completa")
    } else if (promedio >= 90 && trabaja == "si") {
        println("Beca Parcial")
    } else {
        println("Sin beca")
    }

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