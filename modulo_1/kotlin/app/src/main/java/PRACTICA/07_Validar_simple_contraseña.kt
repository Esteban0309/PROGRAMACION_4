package PRACTICA
//Pide contraseña. Valida si tiene >8 caracteres y contiene al menos un digito
fun main() {

    println("Ingresa tu contraseña:")
    val contrasena = readLine() ?: ""

    if (contrasena.length > 8 && contrasena.any { it.isDigit() }) {
        println("Contraseña correcta")
    }
    else {
        println("Contraseña incorrecta.")
    }
}
