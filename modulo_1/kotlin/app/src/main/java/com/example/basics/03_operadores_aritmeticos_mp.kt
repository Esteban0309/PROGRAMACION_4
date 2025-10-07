package com.example.rentacar

fun main() {
    println("Sistema de Alquiler de Vehículos con Operadores Aritméticos")

    val tarifaDiaria: Double = 50.0   
    val diasAlquiler: Double = 5.0    
    val descuento: Double = 0.15      

    val costoTotal = tarifaDiaria * diasAlquiler
    val descuentoAplicado = costoTotal * descuento
    val costoConDescuento = costoTotal - descuentoAplicado

    println("Costo Total: $${costoTotal}")
    println("Descuento Aplicado: $${descuentoAplicado}")
    println("Costo Final con Descuento: $${costoConDescuento}")
}
