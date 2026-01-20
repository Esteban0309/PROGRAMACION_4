void main() {
  int diasAlquiler = 10;
  double costoTotal = 0;
  double costoPorDia = 20;

  for (int i = 1; i <= diasAlquiler; i++) {
    costoTotal += costoPorDia;
    if (i > 5) {
      costoTotal += 5;
    }
  }

  print("El costo total del alquiler por $diasAlquiler días es \$${costoTotal}");
}
