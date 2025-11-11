package com.example.basic

fun main() {
    var totalDia = 0.0
    var cantidadClientes = 0

    println("sistema de caja del supermercado")

    while (true) {
        print("Ingrese total del cliente o escriba 'fin' para terminar: ")
        val input = readln().trim()

        if (input.lowercase() == "fin") {
            break
        }

        val totalCliente = input.toDoubleOrNull()
        if (totalCliente == null) {
            println("Entrada no válida. Intente de nuevo.")
            continue
        }

        print("Ingrese cantidad de items del cliente: ")
        val cantidadItems = readln().toIntOrNull() ?: 0

        var totalFinal = totalCliente

        if (totalCliente > 100) {
            totalFinal *= 0.95 // aplica 5% de descuento
            println("Se aplicó 5% de descuento: $$totalFinal")
        }

        if (cantidadItems > 10) {
            println("Caja rápida no disponible para este cliente")
        }

        totalDia += totalFinal
        cantidadClientes++
        println("cliente procesado")
    }

    println("resumen del dia ")
    println("total acumulado: $$totalDia")
    println("cantidad de clientes atendidos: $cantidadClientes")
}
