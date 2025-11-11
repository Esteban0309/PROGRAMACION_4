package com.example.basic

fun main() {
    print("Ingrese la hora actual (0 a 23): ")
    val hora = readln().toInt()

    print("Ingrese su rol (admin, invitado, empleado): ")
    val rol = readln().lowercase()

    val acceso = when (rol) {
        "admin" -> "acceso permitido las 24 horas."
        "invitado" -> if (hora in 9..17) "acceso permitido." else "acceso denegado."
        "empleado" -> if (hora in 6..20) "acceso permitido." else "acceso denegado."
        else -> "Rol no reconocido."
    }

    println(acceso)
}