package com.example.basic

fun main() {
    var saldo = 1000.0
    var opcion: Int

    println("bienvenido al ATM simplificado")

    do {
        println("Menu")
        println("1) Depositar")
        println("2) Retirar")
        println("3) Salir")
        print("Ingrese su opcion: ")
        opcion = readln().toIntOrNull()  ?: 0

        when (opcion) {
            1 -> {
                print("Ingrese monto a depositar: ")
                val deposito = readln().toDoubleOrNull() ?: 0.0
                saldo += deposito
                println("depósito exitoso. Saldo actual: $$saldo")
            }
            2 -> {
                print("Ingrese monto a retirar: ")
                val retiro = readln().toDoubleOrNull() ?: 0.0
                if (retiro > saldo) {
                    println("retiro rechazado. Saldo insuficiente.")
                } else {
                    saldo -= retiro
                    println("retiro exitoso. Saldo actual: $$saldo")
                }
            }
            3 -> println("Sesión terminada")
            else -> println("Opción no válida. Intente de nuevo.")
        }
    } while (opcion != 3)
}
