package PRACTICA

//Pide texto y cuenta (a,e,i,o,u) sin tildes

fun main() {
    // Pedir el texto
    println("Escribe un texto:")
    val texto = readLine() ?: ""

    var a = 0
    var e = 0
    var i = 0
    var o = 0
    var u = 0

    for (letra in texto) {
        when (letra.toLowerCase()) {
            'a' -> a++
            'e' -> e++
            'i' -> i++
            'o' -> o++
            'u' -> u++
        }
    }
    println("Vocales sin tildes:")
    println("A: $a")
    println("E: $e")
    println("I: $i")
    println("O: $o")
    println("U: $u")
}
