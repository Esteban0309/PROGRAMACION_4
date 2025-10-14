package com.example.basics

fun main() {
    println("Tienda de Alquiler de Vehículos")

    val preciosVehiculos = mapOf(
        "Aveo" to 40,
        "Agya" to 60,
        "RAM" to 100,
        "Mazda" to 25
    )
    println("Precios de los vehículos: ${preciosVehiculos}")


    val clientes = mutableMapOf<String, Int>()
    clientes["Carlos"] = 3
    clientes["Ana"] = 1
    clientes["Pedro"] = 5
    println("Clientes y vehículos alquilados: ${clientes}")

    val vehiculosDisponibles = setOf("Aveo", "Agya", "RAM", "Mazda")
    println("Vehículos disponibles para alquiler: ${vehiculosDisponibles}")


    val vehiculosAlquilados = setOf("RAM", "Mazda")
    println("Vehículos ya alquilados: ${vehiculosAlquilados}")


    println("Operaciones de Conjuntos:")
    val interseccion = vehiculosDisponibles intersect vehiculosAlquilados
    val union = vehiculosDisponibles union vehiculosAlquilados
    val diferencia = vehiculosDisponibles - vehiculosAlquilados
    println("Vehículos alquilados y disponibles: ${interseccion}")
    println("Todos los vehículos (alquilados y disponibles): ${union}")
    println("Vehículos disponibles: ${diferencia}")

    println("Validad Horario de apertura")

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
        in 8..12 -> "La tienda está abierta, puedes alquilar vehículos"
        in 13..17 -> "La tienda está abierta, puedes alquilar vehículos"
        in 18..20 -> "La tienda está cerrada por la tarde, pero abre por la noche"
        else -> "La tienda está cerrada"
    }

    println(mensaje)
}

