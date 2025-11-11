package com.example.hellowjetpackcompose

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp

data class UsuarioEdit (val id: Int, val nombre: String, val rol: String)

class ListaEditable : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent { ListaEditableApp() }
    }
}

@Composable
fun ListaEditableApp() {
    MaterialTheme {
        Surface(Modifier.fillMaxSize()) { ListaEditableScreen() }
    }
}

@Composable
fun ListaEditableScreen() {
    // Estado de la lista
    var autoId by rememberSaveable { mutableStateOf(4) }
    val UsuarioEdits = remember {
        mutableStateListOf(
            UsuarioEdit(1, "Ana Torres", "Diseñadora"),
            UsuarioEdit(2, "Luis Pérez", "Desarrollador"),
            UsuarioEdit(3, "María López", "Tester QA"),
            UsuarioEdit(4, "Carlos Ruiz", "Project Manager")
        )
    }

    // Estado del formulario
    var nombre by rememberSaveable { mutableStateOf("") }
    var rol by rememberSaveable { mutableStateOf("") }
    var seleccionado by remember { mutableStateOf<UsuarioEdit?>(null) }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp),
        verticalArrangement = Arrangement.spacedBy(12.dp)
    ) {
        Text("UsuarioEdits (agregar / eliminar)", style = MaterialTheme.typography.titleLarge)

        // --- Formulario agregar ---
        OutlinedTextField(
            value = nombre,
            onValueChange = { nombre = it },
            label = { Text("Nombre") },
            singleLine = true,
            modifier = Modifier.fillMaxWidth()
        )
        OutlinedTextField(
            value = rol,
            onValueChange = { rol = it },
            label = { Text("Rol") },
            singleLine = true,
            modifier = Modifier.fillMaxWidth()
        )
        Row(horizontalArrangement = Arrangement.End, modifier = Modifier.fillMaxWidth()) {
            TextButton(onClick = { nombre = ""; rol = "" }) { Text("Limpiar") }
            Spacer(Modifier.width(8.dp))
            Button(
                onClick = {
                    val n = nombre.trim()
                    val r = rol.trim()
                    if (n.isNotEmpty() && r.isNotEmpty()) {
                        autoId += 1
                        UsuarioEdits.add(UsuarioEdit(autoId, n, r))
                        nombre = ""; rol = ""
                    }
                },
                enabled = nombre.isNotBlank() && rol.isNotBlank()
            ) { Text("Agregar") }
        }

        Divider()

        // --- Lista ---
        LazyColumn(
            modifier = Modifier
                .fillMaxWidth()
                .weight(1f),
            verticalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            items(UsuarioEdits, key = { it.id }) { user ->
                Card(Modifier.fillMaxWidth()) {
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(12.dp),
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Column(
                            modifier = Modifier
                                .weight(1f)
                                .clickable { seleccionado = user }
                        ) {
                            Text(user.nombre, style = MaterialTheme.typography.titleMedium)
                            Text(user.rol, style = MaterialTheme.typography.bodyMedium)
                        }
                        TextButton(onClick = {
                            UsuarioEdits.removeIf { it.id == user.id }
                            if (seleccionado?.id == user.id) seleccionado = null
                        }) { Text("Eliminar") }
                    }
                }
            }
        }

        // --- Detalle seleccionado ---
        if (seleccionado != null) {
            Card(Modifier.fillMaxWidth()) {
                Column(Modifier.padding(12.dp)) {
                    Text("Seleccionado:", style = MaterialTheme.typography.titleMedium)
                    Text("ID: ${seleccionado!!.id}")
                    Text("Nombre: ${seleccionado!!.nombre}")
                    Text("Rol: ${seleccionado!!.rol}")
                }
            }
        } else {
            Text("Selecciona un UsuarioEdit para ver detalles.")
        }
    }
}

@Preview(showBackground = true)
@Composable
private fun PreviewEditable() { ListaEditableApp() }