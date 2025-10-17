package com.example.rentacar


enum class TipoVehiculo(val color: String, val potencia: Int) {
    SUV(color = "rojo", potencia = 200) {
        override fun descripcion() = "Vehículo grande, ideal para viajes familiares"
    },
    CAMIONETA(color = "azul", potencia = 250) {
        override fun descripcion() = "Camioneta robusta, perfecta para terrenos difíciles"
    },
    DEPORTIVO(color = "amarillo", potencia = 350) {
        override fun descripcion() = "Vehículo rápido y elegante, ideal para altas velocidades"
    },
    ELECTRICO(color = "verde", potencia = 150) {
        override fun descripcion() = "Vehículo ecológico y eficiente, ideal para la ciudad"
    };

    abstract fun descripcion(): String


    companion object {
        fun porColor(color: String) = values().find { it.color == color }
    }
}


class VehiculoAlquiler(val tipo: TipoVehiculo, val propietario: String) {

    fun arrancar() = "¡Vroom! El vehículo $tipo color ${tipo.color} de $propietario está listo para conducir."


    fun info() = "${tipo.descripcion()} - Potencia: ${tipo.potencia} CV"
}

fun main() {

    val suv = VehiculoAlquiler(TipoVehiculo.SUV, propietario = "Carlos")
    println(suv.arrancar())
    println(suv.info())

    // Crear un vehículo de tipo Deportivo
    val deportivo = VehiculoAlquiler(TipoVehiculo.DEPORTIVO, propietario = "Ana")
    println(deportivo.arrancar())
    println(deportivo.info())


    val vehiculoPorColor = TipoVehiculo.porColor("amarillo")
    println("Vehículo encontrado por color amarillo: ${vehiculoPorColor?.descripcion()}")
}
