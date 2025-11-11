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

class Maininput : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent { AppCampoTexto() }
    }
}

@Composable
fun AppCampoTexto() {
    MaterialTheme {
        Surface(Modifier.fillMaxSize()) {
            CampoTextoScreen()
        }
    }
}

@Composable
fun CampoTextoScreen() {
    var nombre by remember { mutableStateOf("") }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(24.dp),
        verticalArrangement = Arrangement.spacedBy(16.dp, Alignment.CenterVertically),
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        OutlinedTextField(
            value = nombre,
            onValueChange = { nombre = it },
            label = { Text("Escribe tu nombre") },
            singleLine = true
        )

        Button(onClick = { nombre = "" }) {
            Text("Limpiar")
        }

        Text(
            text = if (nombre.isBlank()) "Aún no has escrito nada..." else "Hola, $nombre 👋",
            style = MaterialTheme.typography.titleMedium
        )
    }
}

@Preview(showBackground = true)
@Composable
private fun CampoTextoPreview() { AppCampoTexto() }