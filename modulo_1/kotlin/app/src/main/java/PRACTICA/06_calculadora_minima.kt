package PRACTICA
//Bucle de menu: 1)Sumar 2)restar 3)salir. Tras cada operacion, mostrar resultado

fun main() {
    var salir = false

    while (!salir) {

        println("Menú")
        println("1) Sumar")
        println("2) Restar")
        println("3) Salir")
        print("Elige una opción: ")


        val op = readLine()?.toIntOrNull() ?: 0


        if (op == 3) {
            salir = true
            println("¡Vuelve pronto!")
        } else {

            println("Ingrese un número:")
            val n1 = readLine()?.toDoubleOrNull() ?: 0.0
            println("Ingrese otro número:")
            val n2 = readLine()?.toDoubleOrNull() ?: 0.0

            when (op) {
                1 -> {
                    val respuesta = n1 + n2
                    println("El resultado de la suma es: $respuesta")
                }
                2 -> {
                    val respuesta = n1 - n2
                    println("El resultado de la resta es: $respuesta")
                }
                else -> println("Opción inválida")
            }
        }
    }
}
