package com.example.kotlin

fun main(){
    println("Variables")
    val planeta = "Tatooine"
    var jedi = "Anakin"

    jedi = "Obiwan"

    println("tipo de variables")
    println("tipos numéricos")
    println("tipo entero")
    val edad: Int =25
    println(edad)

    println("tipo double")
    val altura: Double =25.5
    println(altura)

    println("tipo float")
    val peso: Float =25.5f
    println(peso)

    println("tipo long")
    val poblacion: Long =2_000_000_000L
    println(poblacion)

    println("tipo Texto")
    val nombre: String ="Obi-wan Kenobi"
    println(nombre)

    println("tipo Char")
    //val inicial: Char ="0"
    //println(inicial)

    println("tipo Lógico")
    val esJedi: Boolean = true
    println(esJedi)

    println("Nulidad")
    val apellido: String? = "Rodriguez"
    println(apellido)

    println("Nulidad")
    val ciudad: String? = ""
    println(ciudad?.length)

    println("Operacion de asercion no null")
    val longitudSegura = apellido!!.length

    println("Interpolación de strings")
    val nombrePrincesa: String ="Leia"
    val edadPrincesa: Int =19
    val planetaPrincesa: String = "Alderan"
    println("${nombrePrincesa.uppercase()}nacio en ${planeta}")
    println("En 10 anios tendra : ${edadPrincesa+10}anios")

    println("string Multilinea")
    val mensaje: String= """
        Querido $nombre
        Tu mision es $planeta
        hasido completada exitosamente
        Que la fuerza te acompañe!
    """
    println(mensaje)

    println("conversiones")
    val textoEdad ="25"
    val edadConverida: Int = textoEdad.toInt()
    println(edadConverida)

    val numero:Double =50.8
    val numeroConvetido: String = numero.toString()
    println(numeroConvetido)



}
