package com.example.hellowjetpackcompose

import android.os.Bundle
import java.net.URLEncoder
import java.nio.charset.StandardCharsets
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.navigation.NavType
import androidx.navigation.compose.*
import androidx.navigation.navArgument

data class UsuarioNav(val id: Int, val nombre: String)

class MainNavigation : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent { NavBasicaApp() }
    }
}

@Composable
fun NavBasicaApp() {
    MaterialTheme {
        Surface(Modifier.fillMaxSize()) {
            val nav = rememberNavController()
            NavHost(navController = nav, startDestination = "home") {

                // Pantalla lista
                composable("home") {
                    HomeScreen(
                        onOpenDetail = { id, nombre ->
                            // Codificar nombre por seguridad (espacios, tildes, etc.)
                            val safe = URLEncoder.encode(nombre, StandardCharsets.UTF_8.toString())
                            nav.navigate("detail/$id/$safe")
                        }
                    )
                }

                // Pantalla detalle con argumentos tipados
                composable(
                    route = "detail/{id}/{nombre}",
                    arguments = listOf(
                        navArgument("id") { type = NavType.IntType },
                        navArgument("nombre") { type = NavType.StringType }
                    )
                ) { backStack ->
                    val id = backStack.arguments?.getInt("id") ?: -1
                    val nombre = backStack.arguments?.getString("nombre") ?: ""
                    DetailScreen(
                        id = id,
                        nombre = nombre,
                        onBack = { nav.popBackStack() }
                    )
                }
            }
        }
    }
}

@Composable
fun HomeScreen(onOpenDetail: (Int, String) -> Unit) {
    val UsuarioNav = remember {
        listOf(
            UsuarioNav(1, "Ana Torres"),
            UsuarioNav(2, "Luis Pérez"),
            UsuarioNav(3, "María López"),
            UsuarioNav(4, "Carlos Ruiz")
        )
    }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp),
        verticalArrangement = Arrangement.spacedBy(12.dp)
    ) {
        Text("Home: selecciona un UsuarioNav", style = MaterialTheme.typography.titleLarge)

        LazyColumn(
            modifier = Modifier
                .fillMaxWidth()
                .weight(1f),
            verticalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            items(UsuarioNav, key = { it.id }) { user ->
                Card(
                    modifier = Modifier
                        .fillMaxWidth()
                        .clickable { onOpenDetail(user.id, user.nombre) }
                ) {
                    Row(
                        modifier = Modifier.padding(12.dp),
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Text("ID: ${user.id} — ${user.nombre}")
                    }
                }
            }
        }
    }
}

@Composable
fun DetailScreen(id: Int, nombre: String, onBack: () -> Unit) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp),
        verticalArrangement = Arrangement.spacedBy(16.dp),
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Text("Detalle", style = MaterialTheme.typography.titleLarge)
        Card(Modifier.fillMaxWidth()) {
            Column(Modifier.padding(16.dp), verticalArrangement = Arrangement.spacedBy(8.dp)) {
                Text("ID: $id", style = MaterialTheme.typography.titleMedium)
                Text("Nombre: $nombre", style = MaterialTheme.typography.bodyLarge)
            }
        }
        Button(onClick = onBack) { Text("⬅️ Volver") }
    }
}

@Preview(showBackground = true)
@Composable
private fun PreviewHome() { MaterialTheme { HomeScreen { _, _ -> } } }

@Preview(showBackground = true)
@Composable
private fun PreviewDetail() { MaterialTheme { DetailScreen(9, "Ejemplo", onBack = {}) } }