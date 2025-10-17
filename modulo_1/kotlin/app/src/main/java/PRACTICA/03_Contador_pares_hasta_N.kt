package PRACTICA

//Pide N y cuenta cuantos numeros pares hay entre 1 y N

fun main () {
    print("Ingrese el numero N: ")
    val n = readLine()?.toIntOrNull()?: 0
    var contador = 0

    for ( l in 1..n){
        if ( l % 2 == 0) {
            contador ++
        }
    }
    println("Hay $contador numeros pares entre 1 y $n")

}