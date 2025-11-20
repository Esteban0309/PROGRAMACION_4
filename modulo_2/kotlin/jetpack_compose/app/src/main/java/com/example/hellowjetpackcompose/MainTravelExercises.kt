package com.example.hellowjetpackcompose

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.navigation.NavController
import androidx.navigation.NavHostController
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController

sealed class TravelScreen(val route: String) {
    object Home : TravelScreen("travel_home")
    object Time : TravelScreen("travel_time")
    object Fuel : TravelScreen("travel_fuel")
}

class MainTravelExercises : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent { TravelNavApp() }
    }
}

@Composable
fun TravelNavApp() {
    val nav = rememberNavController()
    MaterialTheme {
        Surface(modifier = Modifier.fillMaxSize()) {
            NavHost(
                navController = nav,
                startDestination = TravelScreen.Home.route
            ) {
                composable(TravelScreen.Home.route) { TravelHomeScreen(nav) }
                composable(TravelScreen.Time.route) { TravelTimeScreen(nav) }
                composable(TravelScreen.Fuel.route) { FuelScreen(nav) }
            }
        }
    }
}

@Composable
fun TravelHomeScreen(nav: NavHostController) {
    val bg = Color(0xFF020617)
    val cardColor = Color(0xFF0F172A)
    val accent = Color(0xFF6366F1)

    Box(
        modifier = Modifier
            .fillMaxSize()
            .background(bg)
            .padding(16.dp)
    ) {
        Card(
            modifier = Modifier
                .align(Alignment.Center),
            colors = CardDefaults.cardColors(containerColor = cardColor)
        ) {
            Column(
                modifier = Modifier
                    .padding(20.dp)
                    .widthIn(max = 480.dp),
                verticalArrangement = Arrangement.spacedBy(16.dp),
                horizontalAlignment = Alignment.CenterHorizontally
            ) {
                Text(
                    text = "Travel Utilities",
                    style = MaterialTheme.typography.titleLarge,
                    fontWeight = FontWeight.Bold,
                    color = accent
                )
                Text(
                    text = "Choose a simple travel exercise:",
                    color = Color(0xFFE5E7EB)
                )
                Button(
                    onClick = { nav.navigate(TravelScreen.Time.route) },
                    modifier = Modifier.fillMaxWidth(),
                    colors = ButtonDefaults.buttonColors(containerColor = accent)
                ) {
                    Text("Travel Time", color = Color.White)
                }
                Button(
                    onClick = { nav.navigate(TravelScreen.Fuel.route) },
                    modifier = Modifier.fillMaxWidth(),
                    colors = ButtonDefaults.buttonColors(containerColor = Color(0xFF22C55E))
                ) {
                    Text("Fuel Cost", color = Color.White)
                }
                Button(
                    onClick = { nav.navigate(TravelScreen.Fuel.route) },
                    modifier = Modifier.fillMaxWidth(),
                    colors = ButtonDefaults.buttonColors(containerColor = Color(0xFF22C55E))
                ) {
                    Text("Nuevo Button", color = Color.White)
                }
            }
        }
    }
}

@Composable
fun TravelTimeScreen(nav: NavController) {
    val bg = Color(0xFF020617)
    val cardColor = Color(0xFF111827)
    val accent = Color(0xFF8B5CF6)

    var distance by remember { mutableStateOf("") }
    var speed by remember { mutableStateOf("") }

    val hours = travelTimeHours(distance, speed)

    Box(
        modifier = Modifier
            .fillMaxSize()
            .background(bg)
            .padding(16.dp)
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .align(Alignment.Center)
        ) {
            Card(
                modifier = Modifier.fillMaxWidth(),
                colors = CardDefaults.cardColors(containerColor = cardColor)
            ) {
                Column(
                    modifier = Modifier.padding(16.dp),
                    verticalArrangement = Arrangement.spacedBy(12.dp)
                ) {
                    Text(
                        text = "Travel Time",
                        style = MaterialTheme.typography.titleLarge,
                        fontWeight = FontWeight.Bold,
                        color = accent
                    )
                    OutlinedTextField(
                        value = distance,
                        onValueChange = { distance = it },
                        label = { Text("Distance (km)") },
                        modifier = Modifier.fillMaxWidth()
                    )
                    OutlinedTextField(
                        value = speed,
                        onValueChange = { speed = it },
                        label = { Text("Speed (km/h)") },
                        modifier = Modifier.fillMaxWidth()
                    )
                    Text(
                        text = "Time = ${"%.2f".format(hours)} hours",
                        color = Color(0xFFE5E7EB)
                    )
                }
            }

            Spacer(Modifier.height(16.dp))

            Button(
                onClick = { nav.navigateUp() },
                modifier = Modifier.fillMaxWidth(),
                colors = ButtonDefaults.buttonColors(containerColor = accent)
            ) {
                Text("Back", color = Color.White)
            }
        }
    }
}

@Composable


fun FuelScreen(nav: NavController) {
    val bg = Color(0xFF020617)
    val cardColor = Color(0xFF0F172A)
    val accent = Color(0xFFF97316)

    var  by remember { mutableStateOf("") }
    var litersPer100 by remember { mutableStateOf("") }
    var pricePerLiter by remember { mutableStateOf("") }

    val (liters, totalCost) = fuelData(distance, litersPer100, pricePerLiter)

    Box(
        modifier = Modifier
            .fillMaxSize()
            .background(bg)
            .padding(16.dp)
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .align(Alignment.Center)
        ) {
            Card(
                modifier = Modifier.fillMaxWidth(),
                colors = CardDefaults.cardColors(containerColor = cardColor)
            ) {
                Column(
                    modifier = Modifier.padding(16.dp),
                    verticalArrangement = Arrangement.spacedBy(12.dp)
                ) {
                    Text(
                        text = "Fuel Cost",
                        style = MaterialTheme.typography.titleLarge,
                        fontWeight = FontWeight.Bold,
                        color = accent
                    )
                    OutlinedTextField(
                        value = distance,
                        onValueChange = { distance = it },
                        label = { Text("Distance (km)") },
                        modifier = Modifier.fillMaxWidth()
                    )
                    OutlinedTextField(
                        value = litersPer100,
                        onValueChange = { litersPer100 = it },
                        label = { Text("Liters / 100 km") },
                        modifier = Modifier.fillMaxWidth()
                    )
                    OutlinedTextField(
                        value = pricePerLiter,
                        onValueChange = { pricePerLiter = it },
                        label = { Text("Price per liter ($)") },
                        modifier = Modifier.fillMaxWidth()
                    )
                    Text(
                        text = "Liters needed = ${"%.2f".format(liters)} L",
                        color = Color(0xFFE5E7EB)
                    )
                    Text(
                        text = "Total cost = ${"%.2f".format(totalCost)} $",
                        color = Color(0xFFE5E7EB)
                    )
                }
            }

            Spacer(Modifier.height(16.dp))

            Button(
                onClick = { nav.navigateUp() },
                modifier = Modifier.fillMaxWidth(),
                colors = ButtonDefaults.buttonColors(containerColor = accent)
            ) {
                Text("Back", color = Color.White)
            }
        }
    }
}
fun Vacaciones(nav: NavController) {
    val bg = Color(0xFF020617)
    val cardColor = Color(0xFF0F172A)
    val accent = Color(0xFFF97316)

    var distance by remember { mutableStateOf("") }
    var litersPer100 by remember { mutableStateOf("") }
    var pricePerLiter by remember { mutableStateOf("") }

    val (liters, totalCost) = fuelData(distance, litersPer100, pricePerLiter)

    Box(
        modifier = Modifier
            .fillMaxSize()
            .background(bg)
            .padding(16.dp)
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .align(Alignment.Center)
        ) {
            Card(
                modifier = Modifier.fillMaxWidth(),
                colors = CardDefaults.cardColors(containerColor = cardColor)
            ) {
                Column(
                    modifier = Modifier.padding(16.dp),
                    verticalArrangement = Arrangement.spacedBy(12.dp)
                ) {
                    Text(
                        text = "Fuel Cost",
                        style = MaterialTheme.typography.titleLarge,
                        fontWeight = FontWeight.Bold,
                        color = accent
                    )
                    OutlinedTextField(
                        value = distance,
                        onValueChange = { distance = it },
                        label = { Text("Distance (km)") },
                        modifier = Modifier.fillMaxWidth()
                    )
                    OutlinedTextField(
                        value = litersPer100,
                        onValueChange = { litersPer100 = it },
                        label = { Text("Liters / 100 km") },
                        modifier = Modifier.fillMaxWidth()
                    )
                    OutlinedTextField(
                        value = pricePerLiter,
                        onValueChange = { pricePerLiter = it },
                        label = { Text("Price per liter ($)") },
                        modifier = Modifier.fillMaxWidth()
                    )
                    Text(
                        text = "Liters needed = ${"%.2f".format(liters)} L",
                        color = Color(0xFFE5E7EB)
                    )
                    Text(
                        text = "Total cost = ${"%.2f".format(totalCost)} $",
                        color = Color(0xFFE5E7EB)
                    )
                }
            }

            Spacer(Modifier.height(16.dp))

            Button(
                onClick = { nav.navigateUp() },
                modifier = Modifier.fillMaxWidth(),
                colors = ButtonDefaults.buttonColors(containerColor = accent)
            ) {
                Text("Back", color = Color.White)
            }
        }
    }
}

fun travelTimeHours(distance: String, speed: String): Double {
    val d = distance.replace(",", ".").toDoubleOrNull() ?: 0.0
    val s = speed.replace(",", ".").toDoubleOrNull() ?: 0.0
    if (d <= 0.0 || s <= 0.0) return 0.0
    return d / s
}

fun fuelData(distance: String, litersPer100: String, pricePerLiter: String): Pair<Double, Double> {
    val d = distance.replace(",", ".").toDoubleOrNull() ?: 0.0
    val l100 = litersPer100.replace(",", ".").toDoubleOrNull() ?: 0.0
    val price = pricePerLiter.replace(",", ".").toDoubleOrNull() ?: 0.0
    if (d <= 0.0 || l100 <= 0.0 || price <= 0.0) return 0.0 to 0.0
    val liters = d * l100 / 100.0
    val cost = liters * price
    return liters to cost
}

@Preview(showBackground = true)
@Composable
fun PreviewTravelNav() {
    TravelNavApp()
}
