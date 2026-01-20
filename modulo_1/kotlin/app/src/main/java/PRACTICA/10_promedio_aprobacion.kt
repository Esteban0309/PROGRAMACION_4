package PRACTICA

//pide 3 notas (0-20). Promnedia y dice aprobado si >= 14, si no reprobado

fun main() {
    println("Ingresa la primera nota (0-20):")
    val nota1 = readLine()?.toIntOrNull() ?: 0
    println("Ingresa la segunda nota (0-20):")

    val nota2 = readLine()?.toIntOrNull() ?: 0
    println("Ingresa la tercera nota (0-20):")

    val nota3 = readLine()?.toIntOrNull() ?: 0

    val promedio = (nota1 + nota2 + nota3) / 3.0
    println("Tu promedio es: $promedio")

    if (promedio >= 14) {
        println("Aprobado")
    } else {
        println("Reprobado")
    }
}
