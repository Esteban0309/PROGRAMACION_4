package PRACTICA

//Pide N y suma los multiplos de 3 desde 1.N

fun main () {
    println("Ingrese el numero N: ")
    val n = readLine()?.toIntOrNull()?:0
    var contador = 0

    for (l in 1..n) {
        if (l % 3 == 0){
            contador +=l

        }
    }
    println("La suma de multiplos de 3 y $n es: $contador ")

}

