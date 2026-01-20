void main() {
  int edadCliente = 25;

  if (edadCliente > 25) {
    print('El cliente tiene más de 25 años, puede alquilar vehículos premium.');
  }
  if (edadCliente < 18) {
    print('El cliente es menor de edad, no puede alquilar vehículos.');
  }
  if (edadCliente == 25) {
    print('El cliente tiene 25 años, se aplica tarifa estándar.');
  } else {
    print('El cliente no tiene 25 años, se aplica tarifa personalizada.');
  }
  
  int diasAlquilado = 3;
  if (diasAlquilado > 5) {
    print('Descuento del 20% por alquiler largo.');
  } else if (diasAlquilado < 3) {
    print('Cargos adicionales por alquiler corto.');
  } else {
    print('Alquiler estándar con tarifa regular.');
  }

  int edad = 20;
  String tipoCliente = edad >= 18 ? 'adulto' : 'menor';
  print('El cliente es un $tipoCliente y puede alquilar vehículos.');
}
