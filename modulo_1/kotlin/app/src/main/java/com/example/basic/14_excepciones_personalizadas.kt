package com.example.basic

class FuerzainsuficienteException(message: String) : Exception(message)
class MisionPeligrosaException( message: String) : Exception(message)

fun realizarMision (nivelFuerza:Int,peligromision:Int): String{

    return try {
        when {
            nivelFuerza < 30 -> throw FuerzainsuficienteException("Nivel de fuerza muy bajo :${nivelFuerza}")
            nivelFuerza > 80 -> throw MisionPeligrosaException("Mision extremadaamente peligrosa: ${peligromision}")
            else -> {
                "Error inesperado"
            }
        }
        } catch (e: FuerzainsuficienteException) {
            "Error: ${e.message}. Se requiere entrenamiento adicional"

        } catch (e: MisionPeligrosaException) {
            "Error: ${e.message}. Nivel de peligro ${peligromision}"
        }catch (e: Exception) {
            "${e.message}"
        }finally {
            "Reporte enviado"
        }
    }

fun main (){
    println(realizarMision(nivelFuerza = 20, peligromision = 60))
    println(realizarMision(nivelFuerza = 100, peligromision = 60))
}