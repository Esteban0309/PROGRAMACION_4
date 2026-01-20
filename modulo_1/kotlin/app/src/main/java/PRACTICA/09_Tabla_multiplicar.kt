package PRACTICA

//pide un numero y muestra su tabla hasta el 10

fun main() {
    println("Escribe un número:")
    val numero = readLine()?.toInt() ?: 0

    for (i in 1..10) {
        println("$numero x $i = ${numero * i}")
    }
}

