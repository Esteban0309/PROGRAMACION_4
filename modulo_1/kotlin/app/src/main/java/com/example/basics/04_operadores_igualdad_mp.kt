package com.example.rentacar

fun main() {
    println("Sistema de Alquiler de Vehículos con Operadores de Igualdad")

    val vehiculo1: String = "Toyota Agya 2024"
    val vehiculo2: String = "Toyota Agya 2024"
    val vehiculo3: String = String("Toyota Agya 2024".toCharArray())

    val cliente1: String = "Esteban Corella"
    val cliente2: String = "Juan Terán"
    val cliente3: String = "Andrés Armas"

    println("Igualdad estructural (contenido):")
    println(vehiculo1 == vehiculo2) 
    println(vehiculo1 == vehiculo3) 

    println("Igualdad referencial (misma instancia):")
    println(vehiculo1 === vehiculo2) 
    println(vehiculo1 === vehiculo3)

    println("\nComparando clientes:")
    println(cliente1 == cliente2)  
    println(cliente1 == cliente3)  
}
