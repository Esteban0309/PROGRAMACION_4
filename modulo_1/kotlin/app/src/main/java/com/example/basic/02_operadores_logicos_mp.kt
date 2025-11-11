package com.example.kotlin

fun main() {
    println("¡Operadores Lógicos en Admisión!")

    val edad: Int = 19
    val documentosCompletos: Boolean = true
    val promedio: Int = 9
    val esAdmitido = edad >= 18 && documentosCompletos && promedio > 7
    val necesitaRevisar = !documentosCompletos || promedio < 7
    println("Cumple con los requisitos de admisión: $esAdmitido")
    println("Necesita revisión adicional: $necesitaRevisar")
}