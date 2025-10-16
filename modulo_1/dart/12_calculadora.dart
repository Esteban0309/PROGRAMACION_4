void main() {
  final Calculadora calcular = Calculadora(numero1: 7, numero2: 8);
  print(calcular.suma());
  print(calcular.resta());
  print(calcular.multiplicacion());
  print(calcular.division());

}

class Calculadora {
  double numero1 = 0.0;
  double numero2 = 0.0;
  Calculadora({required this.numero1, required this.numero2});

  double suma() {
    return this.numero1 + this.numero2;
  }
  double resta() {
    return this.numero1 - this.numero2;
  }
  double multiplicacion() {
    return this.numero1 * this.numero2;
  }
  double division() {
    return this.numero1 / this.numero2;
  }
  
}
