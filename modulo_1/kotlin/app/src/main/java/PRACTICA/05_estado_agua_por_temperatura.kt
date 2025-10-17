package PRACTICA
//Pide ªC
//<= -> Solido
//1..99 ->Liquido
//>= 100 -> Gas

fun main() {
    println("Ingrese la t en ªC: ")
    val t = readLine()?.toIntOrNull() ?: 0

    when {
        (t <= 0) -> print("Solido")
        t in 1..99 -> println("Liquido")
        t >= 100 -> println("Gas")
    }
}