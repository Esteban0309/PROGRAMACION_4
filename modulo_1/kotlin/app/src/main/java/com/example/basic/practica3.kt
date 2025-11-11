package com.example.basic

fun main(){
    println("ingresa un numero n:")
    val n = readln().toInt()
    var contador = 0
    for (i in 1..n){
        if (i %2 ==0){
            contador++
        }
    }
    println("hay $contador numeros pares entre 1 y n" )
}