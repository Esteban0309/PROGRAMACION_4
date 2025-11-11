package com.example.basic


fun saludar() {
    println("¡Bienvenido a la Calculadora en Kotlin!")
}

// Funciones con parámetros y retorno
fun sumar(a: Int, b: Int): Int {
    return a + b
}

fun restar(a: Int, b: Int): Int {
    return a - b
}

// Función de expresión (single-expression function)
fun multiplicar(a: Int, b: Int) = a * b

// Función con validación (para división)
fun dividir(a: Int, b: Int): String {
    return if (b != 0) "Resultado: ${a / b}"
    else "Error: no se puede dividir entre 0"
}

// Función con retorno múltiple
fun operacionesBasicas(a: Int, b: Int): Pair<Int, Int> {
    val suma = a + b
    val resta = a - b
    return Pair(suma, resta)
}

fun main() {
    saludar()

    print("Ingrese el primer número: ")
    val num1 = readLine()?.toIntOrNull() ?: 0

    print("Ingrese el segundo número: ")
    val num2 = readLine()?.toIntOrNull() ?: 0

    println("Seleccione una operación:")
    println("1. Sumar")
    println("2. Restar")
    println("3. Multiplicar")
    println("4. Dividir")

    val opcion = readLine()?.toIntOrNull() ?: 0

    when (opcion) {
        1 -> println("Resultado: ${sumar(num1, num2)}")
        2 -> println("Resultado: ${restar(num1, num2)}")
        3 -> println("Resultado: ${multiplicar(num1, num2)}")
        4 -> println(dividir(num1, num2))
        else -> println("Opción no válida")
    }

    // Uso de función con retorno múltiple
    val (suma, resta) = operacionesBasicas(num1, num2)
    println("Suma: $suma, Resta: $resta")

    // Funciones lambda
    val potencia = { x: Int -> x * x }
    val saludoLambda = { nombre: String -> "Hola $nombre, ¡bienvenido a Kotlin!" }

    println(potencia(4))
    println(saludoLambda("Sandra"))
}
