void main() {
  print("Alquiler de Vehículos");

  final String vehiculo = "Toyota Agya";
  print("Vehículo disponible: $vehiculo");

  String cliente = "Esteban";
  cliente = "Corella";
  print("Cliente: $cliente");

  const String tipoDeVehiculo = "SUV";
  print("Tipo de vehículo: $tipoDeVehiculo");

  bool vehiculoDisponible = true;
  vehiculoDisponible = true;
  print("¿Está disponible el vehículo? $vehiculoDisponible");

  int precioPorDia = 50; // Precio por día de alquiler en dólares
  print("Precio por día: \$ $precioPorDia");

  List<String> serviciosAdicionales = ["GPS", "Asiento Infantil", "Seguro"];
  print("Servicios adicionales: $serviciosAdicionales");

  final imagenesVehiculo = <String>[
    "src/toyota_corolla.jpg",
    "src/interior.jpg",
  ];
  print("Imágenes del vehículo: $imagenesVehiculo");

  print("Detalles del alquiler:");
  print("""
  Vehículo: $vehiculo
  Precio por día: \$ $precioPorDia
  Servicios: $serviciosAdicionales
  Imágenes: $imagenesVehiculo
  """);
}