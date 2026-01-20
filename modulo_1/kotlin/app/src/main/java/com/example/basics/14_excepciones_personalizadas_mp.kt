package com.example.alquilervehiculos

// Excepciones personalizadas
class VehiculoNoDisponibleException(message: String) : Exception(message)
class CreditoInsuficienteException(message: String) : Exception(message)


fun realizarAlquiler(vehiculoDisponible: Boolean, creditoCliente: Double, precioAlquiler: Double): String {
    return try {
        when {
            !vehiculoDisponible -> throw VehiculoNoDisponibleException("El vehículo no está disponible.")
            creditoCliente < precioAlquiler -> throw CreditoInsuficienteException("Crédito insuficiente para alquilar el vehículo.")
            else -> "Alquiler realizado con éxito. ¡Disfruta tu viaje!"
        }
    } catch (e: VehiculoNoDisponibleException) {
        "Error: ${e.message}. Por favor, elige otro vehículo."
    } catch (e: CreditoInsuficienteException) {
        "Error: ${e.message}. Por favor, asegúrate de tener suficiente crédito."
    } catch (e: Exception) {
        "Error inesperado: ${e.message}"
    } finally {
        "Reporte de alquiler enviado."
    }
}

fun main() {

    println(realizarAlquiler(vehiculoDisponible = false, creditoCliente = 100.0, precioAlquiler = 50.0))

    println(realizarAlquiler(vehiculoDisponible = true, creditoCliente = 30.0, precioAlquiler = 50.0))

    println(realizarAlquiler(vehiculoDisponible = true, creditoCliente = 100.0, precioAlquiler = 50.0))
}
