package com.example.kotlin

fun main() {
    println("Variables")
    val institucion = "Instituto Tecnológico UTE"
    var aspirante = "Carlos"

    aspirante = "María"

    println("Tipos de variables")
    println("Tipos numéricos")
    println("Tipo entero")
    val edad: Int = 18
    println(edad)

    println("Tipo double")
    val promedioNotas: Double = 9.5
    println(promedioNotas)

    println("Tipo float")
    val estatura: Float = 1.68f
    println(estatura)

    println("Tipo long")
    val codigoRegistro: Long = 2_024_000_001L
    println(codigoRegistro)

    println("Tipo texto")
    val nombre: String = "María López"
    println(nombre)

    println("Tipo char")
    //val inicial: Char = 'M'
    //println(inicial)

    println("Tipo lógico")
    val cumpleRequisitos: Boolean = true
    println(cumpleRequisitos)

    println("Nulidad")
    val carrera: String? = "Desarrollo de Software"
    println(carrera)

    println("Nulidad")
    val correo: String? = ""
    println(correo?.length)

    println("Operación de aserción no null")
    val longitudSegura = carrera!!.length

    println("Interpolación de strings")
    val nombreAspirante: String = "María"
    val edadAspirante: Int = 18
    val carreraAspirante: String = "Diseño Gráfico"
    println("${nombreAspirante.uppercase()} se ha inscrito en $carreraAspirante en el $institucion")
    println("En 5 años tendrá: ${edadAspirante + 5} años")

    println("String multilínea")
    val mensaje: String = """
        Estimada $nombre:
        Tu inscripción en la carrera de $carreraAspirante
        en el $institucion ha sido completada exitosamente.
        ¡Bienvenida al nuevo ciclo académico!
    """
    println(mensaje)

    println("Conversiones")
    val textoEdad = "18"
    val edadConvertida: Int = textoEdad.toInt()
    println(edadConvertida)

    val numero: Double = 9.8
    val numeroConvertido: String = numero.toString()
    println(numeroConvertido)
}
