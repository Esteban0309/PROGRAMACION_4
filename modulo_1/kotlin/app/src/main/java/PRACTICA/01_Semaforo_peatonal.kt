package  PRACTICA

//pide color del semaforo (rojo,amarillo, verde) y si el peaton presiono el boton (si/no)
//si esta en verde y presiono -> Espera rojo
//Si esta rojo -> Cruza
// Si amarillo -> Preparate
//En otros casos -> Espera
fun main() {
    println("Ingresa el color del semáforo (rojo, amarillo, verde):")
    val colorsemaforo = readLine()?.toLowerCase() ?: ""

    println("¿El peatón presionó el botón? (si/no)")
    val botonpresionado = readLine()?.toLowerCase() ?: ""

    if (colorsemaforo == "verde" && botonpresionado == "si") {
        println("Espera rojo")
    }
    else if (colorsemaforo == "rojo") {
        println("Puedes Cruzar")
    }
    else if (colorsemaforo == "amarillo") {
        println("Atento ")
    }
    else {
        println("Espera un momento")
    }
}

