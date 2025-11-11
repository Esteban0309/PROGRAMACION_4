package com.example.basic

fun main() {
    for (bateria in 100 downTo 0 step 10) {
        when (bateria) {
            100 -> println("Batería al $bateria% - cargado")
            50 -> println("Batería al $bateria% - mitad de bateria")
            10 -> println("Batería al $bateria% - conecta el cargador")
            0 -> println("Batería al $bateria% - apagado")
        }
    }
}