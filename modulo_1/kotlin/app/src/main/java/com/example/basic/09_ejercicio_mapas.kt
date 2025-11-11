package com.example.basic

//validad de horarios de calses
       // el alumno ingresa una hora 0:23
        //si esta entre 7y13"clase en la mañana"
        //si esta entre 14 y 19 "clase de la tarde"
        //otro caso "horario lectivo"
fun main() {
    println("Validación de horarios de clases")

    print("Ingrese la hora (0 - 23): ")
    val hora: Int = readLine()?.toIntOrNull() ?: -1

    if (hora in 7..13) {
        println("Clase en la mañana")
    } else if (hora in 14..19) {
        println("Clase en la tarde")
    } else {
        println("Fuera del horario lectivo")
    }
}
