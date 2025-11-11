package com.example.basic

// enum = objeto donde podemos incluir una lista de tipos definidos
enum class TipoCarrera(val area: String, val puntajeMinimo: Int) {
    TECNOLOGIA(area = "Tecnologia", puntajeMinimo = 80) {
        override fun description() = "Carrera enfocada en innovacion y desarrollo tecnologico."
    },
    SALUD(area = "Salud", puntajeMinimo = 85) {
        override fun description() = "Carrera orientada al bienestar y servicio comunitario."
    },
    ADMINISTRACION(area = "Administración", puntajeMinimo = 75) {
        override fun description() = "Carrera dedicada a la gestion de recursos y liderazgo organizacional."
    },
    DISEÑO(area = "Diseño", puntajeMinimo = 70) {
        override fun description() = "Carrera que combina creatividad y comunicacion visual."
    };

    abstract fun description(): String
    companion object {
        fun porArea(area: String) = values().find { it.area == area }
    }
}
class Estudiante(val tipo: TipoCarrera, val nombre: String) {
    fun inscribirse() = "El estudiante $nombre se ha inscrito en la carrera del area ${tipo.area}."
    fun info() = "${tipo.description()} - puntaje minimo requerido: ${tipo.puntajeMinimo}"
}

fun main() {
    val estudiante1 = Estudiante(TipoCarrera.SALUD, nombre = "Maria loor")
    println(estudiante1)
    println(estudiante1.inscribirse())
    println(estudiante1.info())

    val estudiante2 = Estudiante(TipoCarrera.TECNOLOGIA, nombre = "Juan Puma")
    println(estudiante2)
    println(estudiante2.inscribirse())
    println(estudiante2.info())
}
