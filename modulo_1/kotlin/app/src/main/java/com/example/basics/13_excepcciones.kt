package com.example.basics

fun main(){
    try{
        val resultado=8/0;
    }catch (e: Exception){
        println("Error en division")
    }
}