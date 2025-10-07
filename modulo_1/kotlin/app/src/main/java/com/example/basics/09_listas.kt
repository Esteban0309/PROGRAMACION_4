package com.example.basics

fun main(){
    println("Listas")
    val inmutableLista: List<Int> = listOf(1,2,3)
    println("Lista Inmutable ${inmutableLista}")

    val mutableLista: MutableList<Int> = mutableListOf(4,5,6)
    println("Lista Mutable ${mutableLista}")
    mutableLista.add(7)
    println("Lista mutable ${mutableLista}")
    mutableLista.removeAt(index = 0)
    println("Lista mutable ${mutableLista}")

    for(mutable in mutableLista) println(mutable)

    println("Operaciones con Mutable List")

    val colores = mutableListOf("rojo", "verde")
    colores.add("Azul")
    colores+="amarillo"
    colores.add( index = 1, element = "blanco")
    println(colores)
    colores.remove(element = "verde")
    println(colores)
    colores.removeAt(index = 0)
    println(colores)
    colores[0]="negro"
    println(colores)
    colores.clear()
    println(colores.isEmpty())

    println("BUSQUEDAS con MuTABLE LIST")
    val nombres = mutableListOf("juan","luis","pedro")
    println(nombres.find  {it.startsWith(prefix = "l")})
    println(nombres.firstOrNull {it.length>4})
    println(nombres.any {it.contains(char = 'j')})
    println(nombres.none {it == "X"})

    println("Ordenamiento con Mutable List")
    val numerosDesordenados = mutableListOf(8,3,2,4,0,6)
    println(numerosDesordenados.sorted())
    println(numerosDesordenados.sortedDescending())
    println(numerosDesordenados.distinct())
    println(numerosDesordenados.sorted())





}