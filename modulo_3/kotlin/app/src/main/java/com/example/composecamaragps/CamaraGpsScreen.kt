package com.ute.composecamaragps

import android.Manifest
import android.content.pm.PackageManager
import android.graphics.Bitmap
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.asImageBitmap
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.core.content.ContextCompat

@Composable
fun CamaraGpsScreen() {
    var fotoBitmap by remember { mutableStateOf<Bitmap?>(null) }
    var textoUbicacion by remember { mutableStateOf("Latitud: --, Longitud: --") }

    val context = LocalContext.current

    // 1) Lanzador que toma la foto (debe declararse primero)
    val takePictureLauncher =
        rememberLauncherForActivityResult(
            contract = ActivityResultContracts.TakePicturePreview()
        ) { bitmap: Bitmap? ->
            if (bitmap != null) {
                fotoBitmap = bitmap
            }
        }

    // 2) Lanzador que solicita el permiso y, si se concede, abre la cámara
    val cameraPermissionLauncher =
        rememberLauncherForActivityResult(
            contract = ActivityResultContracts.RequestPermission()
        ) { isGranted: Boolean ->
            if (isGranted) {
                takePictureLauncher.launch(null)
            }
        }

    fun abrirCamaraConPermiso() {
        val permiso = Manifest.permission.CAMERA
        val estadoPermiso = ContextCompat.checkSelfPermission(context, permiso)
        if (estadoPermiso == PackageManager.PERMISSION_GRANTED) {
            takePictureLauncher.launch(null)
        } else {
            cameraPermissionLauncher.launch(permiso)
        }
    }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp),
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Text(
            text = "Cámara y GPS con Jetpack Compose",
            style = MaterialTheme.typography.titleLarge
        )

        Spacer(modifier = Modifier.height(24.dp))

        Button(
            onClick = { abrirCamaraConPermiso() },
            modifier = Modifier.fillMaxWidth()
        ) {
            Text("Abrir cámara")
        }

        Spacer(modifier = Modifier.height(16.dp))

        Box(
            modifier = Modifier
                .size(220.dp)
                .clip(RoundedCornerShape(16.dp))
                .background(MaterialTheme.colorScheme.surfaceVariant),
            contentAlignment = Alignment.Center
        ) {
            if (fotoBitmap != null) {
                Image(
                    bitmap = fotoBitmap!!.asImageBitmap(),
                    contentDescription = "Fotografía capturada",
                    modifier = Modifier.fillMaxSize()
                )
            } else {
                Text(
                    text = "Aquí se mostrará la fotografía",
                    textAlign = TextAlign.Center
                )
            }
        }

        Spacer(modifier = Modifier.height(24.dp))

        Button(
            onClick = { /* GPS se implementará en la Parte 3 */ },
            modifier = Modifier.fillMaxWidth()
        ) {
            Text("Obtener ubicación")
        }

        Spacer(modifier = Modifier.height(16.dp))

        Text(
            text = textoUbicacion,
            modifier = Modifier.fillMaxWidth(),
            textAlign = TextAlign.Center
        )
    }
}