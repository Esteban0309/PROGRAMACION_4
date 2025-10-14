package com.example.alquilervehiculos


data class Vehiculo(
    val nombre: String,
    val modelo: String,
    val precioAlquiler: Double,
    val disponible: Boolean = true
) {

    val tipoVehiculo: String
        get() = when {
            precioAlquiler >= 100 -> "Vehículo de lujo"
            precioAlquiler >= 50 -> "Vehículo estándar"
            else -> "Vehículo económico"
        }


    fun estaDisponible(): Boolean = disponible


    fun precioAlto(): Boolean = precioAlquiler > 75
}

fun main() {

    val agya = Vehiculo(
        nombre = "Agya",
        modelo = "2023",
        precioAlquiler = 60.0
    )
    println(agya)


    val (nombre, modelo, precioAlquiler) = agya
    println("Vehículo: $nombre, Modelo: $modelo, Precio de alquiler: $$precioAlquiler")


    val mazda = agya.copy(nombre = "Mazda", precioAlquiler = 80.0)
    println(mazda)


    println("El tipo de vehículo de $mazda es: ${mazda.tipoVehiculo}")


    println("¿Está disponible Mazda? ${mazda.estaDisponible()}")
    println("¿Tiene un precio alto Mazda? ${mazda.precioAlto()}")


    val ramLujo = mazda.copy(nombre = "RAM 1500", precioAlquiler = 120.0)
    println(ramLujo)
    println("El tipo de vehículo de $ramLujo es: ${ramLujo.tipoVehiculo}")
}
