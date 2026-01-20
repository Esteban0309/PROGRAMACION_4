package com.example.basics
fun main(){
    var bateria = 100
    while (bateria >= 0){

        when (bateria) {
            100 -> println("bateria al ${bateria}% cargado")
            50 -> println("bateria al ${bateria}% mitad de bateria")
            10 -> println("bateria al ${bateria}% conecte el cargador")
            0 -> println("bateria al ${bateria}% apagado")
        }
        bateria -= 10
    }
}