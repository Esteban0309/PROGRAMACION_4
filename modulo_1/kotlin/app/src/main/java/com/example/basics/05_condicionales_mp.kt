package com.example.rentacar

fun main() {
    println("¡Sistema de Alquiler de Vehículos con Estructuras de Control!")

    // Comparación de precios de vehículos
    val precioVehiculo1: Double = 30000.0
    val precioVehiculo2: Double = 25000.0

    if (precioVehiculo1 > precioVehiculo2) {
        println("El vehículo más caro cuesta: $$precioVehiculo1")
    } else {
        println("El vehículo más caro cuesta: $$precioVehiculo2")
    }

    
    println("\nCategoría según año del vehículo:")
    val añoFabricacion: Int = 2020

    if (añoFabricacion >= 2022) {
        println("Vehículo Nuevo")
    } else if (añoFabricacion >= 2015) {
        println("Vehículo Semi-Nuevo")
    } else {
        println("Vehículo Antiguo")
    }

    
    println("\nCategoría según tipo de combustible:")
    val tipoDeCombustible: String = "Híbrido"

    if (tipoDeCombustible == "Eléctrico") {
        println("Vehículo Ecológico")
    } else if (tipoDeCombustible == "Híbrido") {
        println("Vehículo Semi-Ecológico")
    } else {
        println("Vehículo de Combustión")
    }
}
