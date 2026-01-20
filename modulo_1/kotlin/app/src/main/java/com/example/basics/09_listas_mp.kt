package com.example.basics


fun main() {
    println("Tienda de Alquiler de Vehículos")


    val vehiculosDisponibles: List<String> = listOf("Aveo", "Agya", "RAM", "Mazda")
    println("Vehículos Disponibles (Inmutable): $vehiculosDisponibles")


    val vehiculosAlquilados: MutableList<String> = mutableListOf("RAM", "Mazda")
    println("Vehículos alquilados: $vehiculosAlquilados")


    vehiculosAlquilados.add("Aveo")
    println("Vehículos alquilados después de agregar un Sedan: $vehiculosAlquilados")


    vehiculosAlquilados.removeAt(1)
    println("Vehículos alquilados después de devolver la Mazda: $vehiculosAlquilados")

    // Mostrar los vehículos disponibles para alquiler
    println("Vehículos Disponibles para alquiler: $vehiculosDisponibles")


    println("Operaciones con vehículos alquilados")

    val listaVehiculos = mutableListOf("Aveo", "Agya", "RAM")

    listaVehiculos.add("Toyota")
    listaVehiculos += "Hino"
    listaVehiculos.add(1, "Citroen")
    println("Vehículos disponibles: $listaVehiculos")


    listaVehiculos.remove("Aveo")
    listaVehiculos.removeAt(0)
    println("Vehículos después de eliminación: $listaVehiculos")


    listaVehiculos[0] = "Camión de carga"
    println("Vehículos después de modificación: $listaVehiculos")


    listaVehiculos.clear()
    println("¿La lista de vehículos está vacía? ${listaVehiculos.isEmpty()}")

    println("BUSQUEDAS con vehículos disponibles")
    val inventarioVehiculos = mutableListOf("Aveo", "Agya", "RAM", "Mazda")


    println(inventarioVehiculos.find { it.startsWith("A") })


    println(inventarioVehiculos.firstOrNull { it.length > 6 })


    println(inventarioVehiculos.any { it.contains("M") })


    println(inventarioVehiculos.none { it == "Camion" })

    println("Ordenamiento de vehículos")
    val vehiculosDesordenados = mutableListOf("Aveo", "Mazda", "RAM", "Agya")


    println(vehiculosDesordenados.sorted())


    println(vehiculosDesordenados.sortedDescending())


    println(vehiculosDesordenados.distinct())


    println(vehiculosDesordenados.sorted())
}
