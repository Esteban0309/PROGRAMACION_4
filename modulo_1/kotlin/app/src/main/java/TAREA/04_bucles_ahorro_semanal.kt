package com.example.TAREA

fun main() {
    print("Ingrese su meta de ahorro: ")
    val meta = readln().toDouble()

    print("Ingrese su ahorro inicial: ")
    var ahorro = readln().toDouble()

    var depositoSemanal = 5.0
    var semana = 1

    println("Simulacion de ahorro semanal")

    while (ahorro < meta) {
        println("Semana $semana: depósito de $$depositoSemanal → total ahorrado: $$ahorro")
        ahorro += depositoSemanal
        depositoSemanal += 10
        semana++
    }

    println("Meta alcanzada en $semana semanas con un total de $$ahorro ahorrado")
}