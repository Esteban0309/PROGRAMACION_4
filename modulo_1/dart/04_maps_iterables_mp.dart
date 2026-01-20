void main() {
  print("Gestión de Alquileres - Vehículos Disponibles");

  final vehiculos = ["Toyota", "Honda", "Ford", "Ford", "BMW", "BMW", "BMW", "Audi", "Audi", "Mazda", "Kia", "Nissan"];
  print("Lista original de vehículos: $vehiculos");

  print("Cantidad total de vehículos: ${vehiculos.length}");
  print("Vehículo en la posición 4: ${vehiculos[4]}");
  print("Primer vehículo disponible: ${vehiculos.first}");

  final vehiculosReverso = vehiculos.reversed;
  print("Lista en orden inverso: ${vehiculosReverso}");

  print("Lista en orden inverso (como List): ${vehiculosReverso.toList()}");
  print("Vehículos únicos (sin repetir, como Set): ${vehiculosReverso.toSet()}");
}
