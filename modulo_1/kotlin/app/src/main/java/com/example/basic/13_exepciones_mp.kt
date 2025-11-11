package com.example.basic

fun main(){
    try{
        val cantidadMaterias = 8/0;
    } catch (e:Exception){
        println("error en division")

    }
}