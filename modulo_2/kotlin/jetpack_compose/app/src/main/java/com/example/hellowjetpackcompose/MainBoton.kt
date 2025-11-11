package com.example.hellowjetpackcompose

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp

class MainBoton : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent { AppEstadoBasico() }
    }
}

@Composable
fun AppEstadoBasico() {
    MaterialTheme {
        Surface(Modifier.fillMaxSize()) {
            EstadoBasicoScreen()
        }
    }
}

@Composable
fun EstadoBasicoScreen() {
    var activo by remember { mutableStateOf(false) }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(24.dp),
        verticalArrangement = Arrangement.spacedBy(16.dp, Alignment.CenterVertically),
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Text(if (activo) "Modo ACTIVO ✅" else "Modo INACTIVO ⛔")

        Button(onClick = { activo = !activo }) {
            Text(if (activo) "Desactivar" else "Activar")
        }
    }
}

@Preview(showBackground = true)
@Composable
private fun EstadoPreview() { AppEstadoBasico() }