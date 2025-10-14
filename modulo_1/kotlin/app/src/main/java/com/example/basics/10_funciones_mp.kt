package com.example.rentacar


fun saludarCliente(nombre: String) {
    println("¡Hola, $nombre! Bienvenido a la tienda de alquiler de vehículos.")
}


fun calcularPrecioAlquiler(vehiculo: String, dias: Int): Double {
    val precios = mapOf(
        "Aveo" to 40.0,
        "Agya" to 60.0,
        "RAM" to 100.0,
        "Mazda" to 25.0
    )

    val precioPorDia = precios[vehiculo] ?: 0.0
    return precioPorDia * dias
}


fun calcularDescuento(dias: Int): Double = if (dias >= 7) 0.1 else 0.0


fun calcularPrecioConDescuento(vehiculo: String, dias: Int): Pair<Double, Double> {
    val precioOriginal = calcularPrecioAlquiler(vehiculo, dias)
    val descuento = calcularDescuento(dias)
    val precioConDescuento = precioOriginal * (1 - descuento)
    return Pair(precioOriginal, precioConDescuento)
}

fun main() {

    saludarCliente("Carlos")


    val precioAgya = calcularPrecioAlquiler("Agya", 5)
    println("Precio del alquiler de Agya por 5 días: $$precioAgya")


    val (precioOriginal, precioConDescuento) = calcularPrecioConDescuento("RAM", 10)
    println("Precio original de la RAM por 10 días: $$precioOriginal")
    println("Precio con descuento de la RAM por 10 días: $$precioConDescuento")


    val calcularPrecio = {vehiculo: String, dias: Int ->
        calcularPrecioAlquiler(vehiculo, dias)
    }
    val precioMazda = calcularPrecio("Mazda", 3)
    println("Precio del alquiler de Mazda por 3 días: $$precioMazda")


    val saludoCliente = {nombre: String -> "¡Hola, $nombre! Gracias por elegirnos para alquilar tu vehículo."}
    println(saludoCliente("Ana"))


    val calcularPrecioConDescuentoLambda = {vehiculo: String, dias: Int ->
        val precioOriginal = calcularPrecioAlquiler(vehiculo, dias)
        val descuento = calcularDescuento(dias)
        precioOriginal * (1 - descuento)
    }
    val precioConDescuentoAgya = calcularPrecioConDescuentoLambda("Agya", 8)
    println("Precio con descuento de Agya por 8 días: $$precioConDescuentoAgya")
}
