package com.example.basics

fun saludar(){
    println("Hola desde una funcion de Kotlin")
}

// funcion con parametros y retorno
fun sumar(a: Int, b: Int): Int{
    return a+b
}

//funciuon con expresion single-expression function
fun cuadrado(numero: Int) = numero * numero

//funciuon con retorno multiple
fun retornoMultiple(a: Int, b: Int): Pair<Int,Int> {
    val suma = a+b
    val resta = a-b
    return Pair(suma, resta)
 }


fun main(){
    saludar()
    val resultado = sumar(a=5,b=6)
    println(resultado)
    println(cuadrado(numero = 5))
    println(retornoMultiple(a=15, b=5))

    //funcion lambda
    val cuadradoLambda = {x:Int-> x*x}
    val saludoLambda = {nombre: String-> "Good morning, $nombre"}
    println(cuadradoLambda(4))
    println(saludoLambda("Juan Luis Guerra"))

<<<<<<< HEAD
    //Calculadora
=======
>>>>>>> a81b8b4ae198e17fe11ac68d5ef9750d72a3e0f6




}