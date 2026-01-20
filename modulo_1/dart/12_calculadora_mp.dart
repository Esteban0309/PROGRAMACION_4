void main() {
  final AlquilerVehiculo alquiler = AlquilerVehiculo(dias: 5, tarifaDiaria: 40);
  print('Costo Total: \$${alquiler.costoTotal()}');
  print('Costo con Descuento: \$${alquiler.costoConDescuento(10)}');  
  print('Impuesto: \$${alquiler.impuesto()}');
  print('Costo Final con Impuesto: \$${alquiler.costoConImpuesto()}');
}

class AlquilerVehiculo {
  double dias = 0.0;
  double tarifaDiaria = 0.0;
  
  AlquilerVehiculo({required this.dias, required this.tarifaDiaria});

  
  double costoTotal() {
    return this.dias * this.tarifaDiaria;
  }

  
  double costoConDescuento(double porcentajeDescuento) {
    double total = costoTotal();
    return total - (total * porcentajeDescuento / 100);
  }

  
  double impuesto() {
    return costoTotal() * 0.15;
  }

  
  double costoConImpuesto() {
    return costoTotal() + impuesto();
  }
}
