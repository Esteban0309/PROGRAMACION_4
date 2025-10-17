package com.example.tiendaalquilervehiculos

fun main() {
    println("VARIABLES EN TIENDA DE ALQUILER DE VEHÍCULOS")

    val ubicacion = "Quito"
    var vehiculoDisponible = "Toyota Corolla"

    vehiculoDisponible = "Honda Civic"

    println("Tipos de Variables")
    println("Tipos numéricos")

    println("Tipo Edad del Cliente")
    val edadCliente: Int = 30
    println("Edad del cliente: $edadCliente")

    println("Tipo Double")
    val precioAlquilerDiario: Double = 35.75
    println("Precio de alquiler diario: $precioAlquilerDiario €")

    println("Tipo Float")
    val kilometrosMaximos: Float = 300f
    println("Kilómetros máximos permitidos: $kilometrosMaximos km")

    println("Tipo Long")
    val cantidadDeAutosDisponibles: Long = 50L
    println("Cantidad de vehículos disponibles: $cantidadDeAutosDisponibles")

    println("Tipo Texto")
    val nombreCliente: String = "Carlos Pérez"
    println("Nombre del cliente: $nombreCliente")

    println("Tipo Char")
    val tipoVehiculo: Char = 'S' // S para Sedan, C para Coupe, etc.
    println("Tipo de vehículo: $tipoVehiculo")

    println("Tipo Lógico")
    val alquilerActivo: Boolean = true
    println("¿Alquiler activo? $alquilerActivo")

    println("Nulidad")
    val fechaDeDevolucion: String? = null
    println("Fecha de devolución: $fechaDeDevolucion")

    println("Nulidad segura")
    val ciudadDeAlquiler: String? = "Madrid"
    println("Longitud de la ciudad de alquiler: ${ciudadDeAlquiler?.length ?: 0}")

    println("Interpolación de Strings")
    val nombreVehiculo: String = "Ford Fiesta"
    val diasAlquiler: Int = 7
    println("El vehículo $nombreVehiculo está disponible por $diasAlquiler días.")
    println("El costo total del alquiler es: ${precioAlquilerDiario * diasAlquiler} €")

    println("String Multitarea")
    val mensaje: String = """
        Estimado $nombreCliente,
        Gracias por alquilar un $vehiculoDisponible
        El vehículo está listo para ser retirado en nuestra tienda en $ubicacion.
        ¡Le deseamos un excelente viaje! """
    println(mensaje)

    println("Conversiones")
    val textoPrecio: String = "30"
    val precioConvertido: Int = textoPrecio.toInt()
    println("Precio convertido: $precioConvertido €")

    val kilometrosRecorridos: Double = 123.4
    val kilometrosConvertidos: String = kilometrosRecorridos.toString()
    println("Kilómetros recorridos: $kilometrosConvertidos km")
}
