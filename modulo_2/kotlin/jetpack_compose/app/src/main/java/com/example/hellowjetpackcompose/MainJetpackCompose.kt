package com.example.hellowjetpackcompose


import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.*
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontStyle
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp

class MainJetpackCompose : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent { HolaMundoApp() }
    }
}

@Composable
fun HolaMundoApp() {
    MaterialTheme {
        Surface(Modifier.fillMaxSize()) {
            Box(Modifier.fillMaxSize(), contentAlignment = Alignment.Center) {
                Text("Hola, Jetpack Compose")
            }
            Box(Modifier
                .fillMaxSize()
                .padding(top = 30.dp),
                contentAlignment = Alignment.TopStart) {
                Text(text = "Hola, Desde Arriba",
                    color = Color(color = 0xFF4CAF50),
                    fontSize = 28.sp,
                    fontWeight = FontWeight.Bold,
                    fontStyle = FontStyle.Italic
                )
            }
        }
    }
}

@Preview(showBackground = true)
@Composable
private fun PreviewHola() { HolaMundoApp() }