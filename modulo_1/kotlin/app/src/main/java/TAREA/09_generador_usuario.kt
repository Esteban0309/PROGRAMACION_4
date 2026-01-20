package com.example.TAREA

fun main() {
    print("Ingrese su nombre: ")
    val nombre = readln().trim()
    print("Ingrese su apellido: ")
    val apellido = readln().trim()

    var username = ""
    var i = 0
    var j = 0

    while (i < nombre.length || j < apellido.length) {
        if (i + 1 < nombre.length) {
            username += nombre.substring(i, i + 2)
            i += 2
        } else if (i < nombre.length) {
            username += nombre[i]
            i++
        }

        if (j + 1 < apellido.length) {
            username += apellido.substring(j, j + 2)
            j += 2
        } else if (j < apellido.length) {
            username += apellido[j]
            j++
        }
    }
    var contador = 1
    while (username.length < 6) {
        username += contador
        contador++
    }

    println("Nombre: $nombre")
    println("Apellido: $apellido")
    println("Usuario generado: ${username.lowercase()}")
}
