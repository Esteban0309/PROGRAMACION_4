package com.example.hellowjetpackcompose

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.navigation.NavController
import androidx.navigation.NavHostController
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController

sealed class MoneyScreen(val route: String) {
    object Home : MoneyScreen("money_home")
    object Tip : MoneyScreen("tip")
    object Temperature : MoneyScreen("temperature")
}

class MainMoneyExercises : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent { MoneyNavApp() }
    }
}

@Composable
fun MoneyNavApp() {
    val nav = rememberNavController()
    MaterialTheme {
        Surface(modifier = Modifier.fillMaxSize()) {
            NavHost(
                navController = nav,
                startDestination = MoneyScreen.Home.route
            ) {
                composable(MoneyScreen.Home.route) { MoneyHomeScreen(nav) }
                composable(MoneyScreen.Tip.route) { TipScreen(nav) }
                composable(MoneyScreen.Temperature.route) { TemperatureScreen(nav) }
            }
        }
    }
}

@Composable
fun MoneyHomeScreen(nav: NavHostController) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp),
        verticalArrangement = Arrangement.Center,
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Text(
            text = "Daily Money Exercises",
            style = MaterialTheme.typography.titleLarge,
            fontWeight = FontWeight.Bold
        )
        Spacer(Modifier.height(20.dp))
        Button(
            onClick = { nav.navigate(MoneyScreen.Tip.route) },
            modifier = Modifier.fillMaxWidth()
        ) {
            Text("Restaurant Tip Calculator")
        }
        Spacer(Modifier.height(12.dp))
        Button(
            onClick = { nav.navigate(MoneyScreen.Temperature.route) },
            modifier = Modifier.fillMaxWidth()
        ) {
            Text("Temperature Converter")
        }
    }
}

@Composable
fun TipScreen(nav: NavController) {
    var amount by remember { mutableStateOf("") }
    var tipPercent by remember { mutableStateOf("") }

    val tip = moneyTipAmount(amount, tipPercent)
    val total = moneyTotalWithTip(amount, tipPercent)

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp),
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        Text(
            text = "Restaurant Tip",
            style = MaterialTheme.typography.titleLarge,
            fontWeight = FontWeight.Bold
        )

        OutlinedTextField(
            value = amount,
            onValueChange = { amount = it },
            label = { Text("Bill amount ($)") },
            modifier = Modifier.fillMaxWidth()
        )
        OutlinedTextField(
            value = tipPercent,
            onValueChange = { tipPercent = it },
            label = { Text("Tip (%)") },
            modifier = Modifier.fillMaxWidth()
        )

        Text("Tip = ${"%.2f".format(tip)} $")
        Text("Total = ${"%.2f".format(total)} $")

        Button(
            onClick = { nav.navigateUp() },
            modifier = Modifier.fillMaxWidth()
        ) {
            Text("Back")
        }
    }
}

@Composable
fun TemperatureScreen(nav: NavController) {
    var celsius by remember { mutableStateOf("") }
    var fahrenheit by remember { mutableStateOf("") }

    val cToF = celsiusToFahrenheitMoney(celsius)
    val fToC = fahrenheitToCelsiusMoney(fahrenheit)

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp),
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        Text(
            text = "Temperature Converter",
            style = MaterialTheme.typography.titleLarge,
            fontWeight = FontWeight.Bold
        )

        Card(modifier = Modifier.fillMaxWidth()) {
            Column(
                modifier = Modifier.padding(12.dp),
                verticalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                Text("From Celsius to Fahrenheit", fontWeight = FontWeight.SemiBold)
                OutlinedTextField(
                    value = celsius,
                    onValueChange = { celsius = it },
                    label = { Text("Celsius") }
                )
                Text("Result: ${"%.2f".format(cToF)} °F")
            }
        }

        Card(modifier = Modifier.fillMaxWidth()) {
            Column(
                modifier = Modifier.padding(12.dp),
                verticalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                Text("From Fahrenheit to Celsius", fontWeight = FontWeight.SemiBold)
                OutlinedTextField(
                    value = fahrenheit,
                    onValueChange = { fahrenheit = it },
                    label = { Text("Fahrenheit") }
                )
                Text("Result: ${"%.2f".format(fToC)} °C")
            }
        }

        Button(
            onClick = { nav.navigateUp() },
            modifier = Modifier.fillMaxWidth()
        ) {
            Text("Back")
        }
    }
}

fun moneyTipAmount(amount: String, tipPercent: String): Double {
    val a = amount.replace(",", ".").toDoubleOrNull() ?: 0.0
    val t = tipPercent.replace(",", ".").toDoubleOrNull() ?: 0.0
    if (a < 0.0 || t < 0.0) return 0.0
    return a * (t / 100.0)
}

fun moneyTotalWithTip(amount: String, tipPercent: String): Double {
    val a = amount.replace(",", ".").toDoubleOrNull() ?: 0.0
    val t = tipPercent.replace(",", ".").toDoubleOrNull() ?: 0.0
    if (a < 0.0 || t < 0.0) return 0.0
    return a + moneyTipAmount(amount, tipPercent)
}

fun celsiusToFahrenheitMoney(celsius: String): Double {
    val c = celsius.replace(",", ".").toDoubleOrNull() ?: 0.0
    return c * 9.0 / 5.0 + 32.0
}

fun fahrenheitToCelsiusMoney(fahrenheit: String): Double {
    val f = fahrenheit.replace(",", ".").toDoubleOrNull() ?: 0.0
    return (f - 32.0) * 5.0 / 9.0
}

@Preview(showBackground = true)
@Composable
fun PreviewMoneyNav() {
    MoneyNavApp()
}