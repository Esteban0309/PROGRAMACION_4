void main() {
  print("Cálculo de Alquiler de Vehículos");

  final double precioPorDia = 45.0;
  final double diasAlquilado = 5;

  print("Precio por día: \$${precioPorDia}");
  print("Días alquilado: $diasAlquilado");

  print("Costo total: \$${precioPorDia * diasAlquilado}");
  print("Descuento por día (si aplica): \$${precioPorDia - 5}");
  print("Costo promedio diario (sin impuestos): \$${(precioPorDia * diasAlquilado) / diasAlquilado}");
}
