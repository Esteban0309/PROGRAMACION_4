package com.example.basics

enum class TipoSable(val color:String, val poder:Int) {
    AZUL(color="azul",poder=85){
        override fun descripcion()="Sable tradicional de los Jedi"
    },
    VERDE(color="verde", poder=90){
        override fun descripcion()="Sable de los Jedi consultares"
    },
    ROJO(color="rojo", poder=95) {
        override fun descripcion() = "Sable de los Sith"
    },
    MORADO(color="morado", poder=95)
    {
        override fun descripcion() = "Sable equilibra luz y oscuridad"
    };
    abstract fun descripcion (): String
    companion object{
        fun porColor(color: String)= values().find{it.color==color}
    }
}
class Sabledeluz(val tipo: TipoSable,val portador: String){
    fun activar() = "!ZZZrum! El sable color ${tipo.color} de ${portador} se enciende"
    fun info()= "${tipo.descripcion()} - tipo poder ${tipo.poder}"
}

fun  main(){
    val sableWindoo = Sabledeluz(TipoSable.MORADO, portador = "Windoo")
    println(sableWindoo)
    println(sableWindoo.activar())
    println(sableWindoo.info())

    val sableluke = Sabledeluz(TipoSable.VERDE, portador = "Luke Skywalker")
    println(sableluke)
    println(sableluke.activar())
    println(sableluke.info())
}