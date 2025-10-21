void main() {
  print("Alquiler de Vehículos");
  final Map<String, dynamic> vehiculo = {
    'modelo': 'Toyota Agya',
    'precioDiario': 25,  // Ajusté el precio a un valor más bajo, típico de vehículos compactos
    'disponible': true,
    'caracteristicas': <String>['Aire acondicionado', 'Radio Bluetooth', 'Económico en consumo de gasolina'],
    'imagenes': {
      1: 'src/toyota_agya1.jpg',
      2: 'src/toyota_agya2.jpg'
    }
  };

  print(vehiculo);
  print('Modelo: ${vehiculo['modelo']}');
  print('Características: ${vehiculo['caracteristicas']}');
  print('¿Disponible? ${vehiculo['disponible']}');
  print('Imágenes: ${vehiculo['imagenes']}');
}
