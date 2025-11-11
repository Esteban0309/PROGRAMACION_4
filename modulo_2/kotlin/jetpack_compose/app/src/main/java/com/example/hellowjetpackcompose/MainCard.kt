package com.example.hellowjetpackcompose


import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp

class MainCard : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent { FichaUsuarioApp() }
    }
}

@Composable
fun FichaUsuarioApp() {
    MaterialTheme {
        Surface(Modifier.fillMaxSize()) { FichaUsuarioScreen() }
    }
}

@Composable
fun FichaUsuarioScreen() {
    var nombre by rememberSaveable { mutableStateOf("") }
    var disponible by rememberSaveable { mutableStateOf(false) }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(24.dp),
        verticalArrangement = Arrangement.spacedBy(16.dp, Alignment.Top),
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        // Entrada de datos
        OutlinedTextField(
            value = nombre,
            onValueChange = { nombre = it },
            label = { Text("Nombre") },
            singleLine = true,
            modifier = Modifier.fillMaxWidth()
        )

        // Switch de disponibilidad
        Row(
            modifier = Modifier.fillMaxWidth(),
            verticalAlignment = Alignment.CenterVertically,
            horizontalArrangement = Arrangement.SpaceBetween
        ) {
            Text("Disponible")
            Switch(checked = disponible, onCheckedChange = { disponible = it })
        }

        // Tarjeta con la "ficha"
        Card(modifier = Modifier.fillMaxWidth()) {
            Column(Modifier.padding(16.dp), verticalArrangement = Arrangement.spacedBy(10.dp)) {
                // Avatar simple (círculo de color que cambia por estado)
                Row(verticalAlignment = Alignment.CenterVertically, horizontalArrangement = Arrangement.spacedBy(12.dp)) {
                    Box(
                        Modifier
                            .size(36.dp)
                            .clip(CircleShape)
                            .background(if (disponible) MaterialTheme.colorScheme.primary else MaterialTheme.colorScheme.secondary)
                    )
                    Column {
                        Text(text = if (nombre.isBlank()) "Nombre Apellido" else nombre, style = MaterialTheme.typography.titleMedium)
                        Text(
                            text = if (disponible) "Estado: Disponible ✅" else "Estado: Ocupado ⛔",
                            style = MaterialTheme.typography.bodyMedium
                        )
                    }
                }
                // Acciones
                Row(horizontalArrangement = Arrangement.End, modifier = Modifier.fillMaxWidth()) {
                    TextButton(onClick = { nombre = ""; disponible = false }) { Text("Limpiar") }
                    Spacer(Modifier.width(8.dp))
                    Button(onClick = { /* Aquí podrías guardar/enviar más adelante */ }, enabled = nombre.isNotBlank()) {
                        Text("Guardar")
                    }
                }
            }
        }
    }
}

@Preview(showBackground = true)
@Composable
private fun PreviewFicha() { FichaUsuarioApp() }