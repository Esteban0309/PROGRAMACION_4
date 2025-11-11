package com.example.basic

class PuntajeInsuficienteException(message: String) : Exception(message)
class PuntajeExcesivoException(message: String) : Exception(message)

fun evaluarAdmisión(puntaje: Int, dificultadExamen: Int): String {

    return try {
        when {
            puntaje < 30 -> throw PuntajeInsuficienteException("Puntaje muy bajo: ${puntaje}")
            puntaje > 80 -> throw PuntajeExcesivoException("Examen extremadamente difícil: ${dificultadExamen}")
            else -> {
                "Evaluación realizada correctamente. El puntaje es aceptable."
            }
        }
    } catch (e: PuntajeInsuficienteException) {
        "Error: ${e.message}. Se recomienda reforzar los conocimientos"
    } catch (e: PuntajeExcesivoException) {
        "Error: ${e.message}. Nivel de dificultad ${dificultadExamen}."
    } catch (e: Exception) {
        "Error inesperado: ${e.message}"
    } finally {
        println("reporte enviado al sistema de admisiones.")
    }
}

fun main() {
    println(evaluarAdmisión(puntaje = 20, dificultadExamen = 60))
    println(evaluarAdmisión(puntaje = 100, dificultadExamen = 60))
}