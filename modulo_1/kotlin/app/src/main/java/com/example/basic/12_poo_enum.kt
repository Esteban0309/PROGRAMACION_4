package com.example.basic
//enum= objeto donde podemos icluir una
enum class TipoSable (val color: String, val poder:Int){
    AZUL(color= "azul", poder= 85) {
        override fun description ()= "sable tradicional de los Jedi"
    },
    VERDE(color= "verde", poder= 90) {
        override fun description ()= "sable de los Jedi consultores"
    },
    ROJO(color= "rojo", poder= 95){
        override fun description ()= "sable de los sith"
    },
    MORADO(color= "morado", poder= 95){
        override fun description() = "sable Equilibra luz y oscuridad"
    };
    abstract fun description() : String
    companion object{
        fun porColor(color: String)= values().find { it.color==color }
    }
}
class SableDeLuz(val tipo : TipoSable, val portador: String){
    fun activar ()="ZZZrum! El sable color ${tipo.color}de ${portador}se enciende"
    fun info()= "${tipo.description()} - tipo poder ${tipo.poder}"
}
fun main (){
    val sableWindoo = SableDeLuz(TipoSable.MORADO, portador = "windoo")
    println(sableWindoo)
    println(sableWindoo.activar())
    println(sableWindoo.info())

    val sableluke = SableDeLuz(TipoSable.VERDE, portador = "LUKE SKYWALKER")
    println(sableluke)
    println(sableluke.activar())
    println(sableluke.info())
}