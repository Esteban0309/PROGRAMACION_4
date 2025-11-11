package com.example.basic

fun main(){
    println("ingresa un numero n:")
    val numero= readln().toInt()
    var suma =0

    for (i in 1..numero){
        if (i %3 == 0 )
            suma += i
    }
    println("la suma de los multiplos de 3 entre 1 y $numero es: $suma")
}