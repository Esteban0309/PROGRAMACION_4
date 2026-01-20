void main() {
  final Vehiculo coche1 = Vehiculo(nombre: 'Toyota Agya', tipo: 'Sedán');
  print(coche1);
  print(coche1.nombre);
  print(coche1.tipo);
  print(coche1.estadoDisponibilidad);
}

class Vehiculo {
  String nombre = "";
  String tipo = "";
  String estadoDisponibilidad = "Disponible";  // Por defecto, está disponible

  Vehiculo({required this.nombre, required this.tipo, this.estadoDisponibilidad = "Disponible"});

  @override
  String toString() {
    return "$nombre - $tipo - Estado: $estadoDisponibilidad";
  }
}
