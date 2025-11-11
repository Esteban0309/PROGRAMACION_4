package com.example.basics

fun main(){
    println("bucles")
    val jedis = listOf("luke","leia","obi-wan","yoda","ahsoka")
    for ((index,jedi) in jedis.withIndex()){
        println("${index+1}.$jedi")
    }
    //rangos de paso
    for (i in 0..20 step 2){
        println("energia: $i%")
    }

    //rangos descendentes
    for (countdown in 10 downTo 1){
        println("despegue en: $countdown")
    }

    //control de flujo
    for (jedi in jedis) {
        if (jedi == "obi-wan") continue //saltar entre accion
        if (jedi == "yoda") break //saltar esta interaccion
        println("entrenando a $jedi")
    }
}