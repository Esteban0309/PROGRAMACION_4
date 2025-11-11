package com.example.basic

fun main() {
    println("Listas")
    val inmutableLista: List<Int> = listOf(1, 2, 3)
    println("Lista inmutabñlle${inmutableLista}")

    val mutableLista: MutableList<Int> = mutableListOf(4, 5, 6)
    println("lista mutable ${mutableLista}")
    mutableLista.add(7)
    println("lista mutable ${mutableLista}")
    mutableLista.removeAt(index = 0)
    println("lista mutable ${mutableLista}")

    for (mutable in mutableLista) println(mutable)
    println("operaciones con mutable List")

    val colores = mutableListOf("rojoj", "verde")
    colores.add("azul")
    colores += "amarillo"
    colores.add(index = 1, element = "blanco")
    println(colores)
    colores.remove(element= "verde")
    println(colores)
    colores.removeAt(index= 0)
    println(colores)
    colores[0]="negro"
    println(colores)
    colores.clear()
    println(colores.isEmpty())

    println("busquedas con mutable List")
    val nombres= mutableListOf("juan,","luis", "pedro")
    println(nombres.find { it.startsWith(prefix = "l") })
    println(nombres.firstOrNull { it.length>4 })
    println(nombres.any { it.contains(char = 'p') })
    println(nombres.none{it=="X"})

    println("ordenamiento con mutable List")
    val numerosDessordemados= mutableListOf(8,3,2,4,7,2,7,0,6)
    println(numerosDessordemados.sorted())
    println(numerosDessordemados.sortedDescending())
    println(numerosDessordemados.distinct())
}