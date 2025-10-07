package com.example.basics

fun main(){
    println("VARIABLES")
    val planeta = "Tatooine"
    var jedi = "Anakin"

    jedi = "Obiwan"

    println("Tipos de Variables")
    println("Tipos numericos")

    println("Tipo Enero")
    val edad : Int = 25
    println(edad)

    println("Tipo Double")
    val altura: Double = 25.5
    println(altura)

    println("Tipo Float")
    val peso: Float = 25.5f
    println(peso)

    println("Tipo Long")
    val poblacion: Long =2_000_000L
    println(poblacion)

    println("Tipo Texto")
    val nombre: String ="Obi_Wan Kenobi"
    println(nombre)

    println("Tipo Char")
    val inicial: Char = '0'
    println(inicial)

    println("Tipo Logico")
    val esJedi: Boolean = true
    println(esJedi)

    println("Nulidad")
    val apellido: String? = null
    println(apellido)

    println("Nulidad")
    val ciudad: String? = ""
    println(ciudad?.length)

    val longitudSegura = apellido?.length ?: 0
    println("Longitud segura: $longitudSegura")


    println("Interpolacion de Strings")
    val nombrep: String = "Leila"
    val edadp: Int = 19
    val planetap: String="Alderan"
    println("${nombrep.uppercase()} nacio en ${planetap}")
    println("En 10 años tendra : ${edadp+ 10} anios")

    println("String Multitarea")
    val mensaje: String = """
        Querido $nombre
        Tu mision en $planeta
        ha sido completamente exitoso
        Que la fuerza te acompañe """
    println(mensaje)

    println("Conversiones")
    val textoEdad: String = "25"
    val edadConvertida : Int = textoEdad.toInt()
    println(edadConvertida)

    val numero: Double = 50.8
    val numeroConvertido: String = numero.toString()
    println(numeroConvertido)

}
