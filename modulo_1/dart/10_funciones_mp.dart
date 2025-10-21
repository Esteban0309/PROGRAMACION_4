void main() {
  print(greetEveryone());
  print(totalCost(3, 20));
  print(addExtraCost(6, 5));
  print(addExtraCost(8));
  print(greetCustomer(name: "Corella", message: "Gracias por alquilar con nosotros"));
  print(greetCustomer(name: "Esteban"));
}

String greetEveryone() => "Bienvenidos al alquiler de vehículos";
int totalCost(int dias, int tarifaDia) => dias * tarifaDia;

int addExtraCost(int dias, [int extraCost = 0]) {
  return dias * 20 + extraCost;
}

String greetCustomer({required String name, String message = "Bienvenido"}) {
  return '$message, $name';
}
