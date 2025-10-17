package PRACTICA

//pide edad. base $5
//<12  -> $3
//>65 -> $4
// Si no. $5

fun main() {
    println("Ingrese la edad: ")
    val edad = readLine()?.toIntOrNull() ?: 0
    val precio = when {
        edad < 12 -> 3
        edad >65 -> 4
        else -> 5
    }
    println("El precio de la entrada es: $precio")
}