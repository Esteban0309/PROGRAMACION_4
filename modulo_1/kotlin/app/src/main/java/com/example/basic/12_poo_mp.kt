package com.example.basic

data class Aspirante(
    val nombre: String,
    val edad: Int,
    val puntajeAdmision: Int,
    val carreraElegida: String? = null,
) {
    val categoria: String
        get() = when {
            puntajeAdmision >= 90 -> "Admitido con excelencia"
            puntajeAdmision >= 70 -> "Admitido"
            puntajeAdmision >= 50 -> "En lista de espera"
            else -> "No admitido"
        }
    fun puedeObtenerBeca(): Boolean = puntajeAdmision >= 85
    fun puedeInscribirse(): Boolean = edad >= 17
}

fun main() {
    val aspirante1 = Aspirante(
        nombre = "Maria Loor",
        edad = 18,
        puntajeAdmision = 78,
        carreraElegida = "Desarrollo de Software"
    )
    println(aspirante1)

    // desestructuración del objeto
    val (nombre, edad, puntajeAdmision, carreraElegida) = aspirante1
    println("Nombre de aspirante: $nombre, Edad: $edad, Puntaje de admision: $puntajeAdmision, Carrera: $carreraElegida")

    // Copiar objeto
    val aspirante2 = aspirante1.copy(nombre = "Juan Puma", puntajeAdmision = 92)
    println(aspirante2)

    // Propiedades calculadas
    println("Categoria de aspirante ${aspirante2.nombre}: ${aspirante2.categoria}")
    println("${aspirante2.nombre} puede obtener beca: ${aspirante2.puedeObtenerBeca()}")
    println("${aspirante2.nombre} puede inscribirse: ${aspirante2.puedeInscribirse()}")
}
