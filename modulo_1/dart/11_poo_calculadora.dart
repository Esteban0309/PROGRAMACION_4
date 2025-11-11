void main() {
final Calculadora calcular =Calculadora(n1:7,n2:8);
  print(calcular.suma());
  print(calcular.resta());
  print(calcular.multiplicacion());
  print(calcular.division());
  
}

class Calculadora{
  double n1=0.0 ;
  double n2=0.0;
  Calculadora({ required this.n1,required this.n2});
  
    double suma(){
      return this.n1+this.n2;
    } 
    double resta(){
      return this.n1-this.n2;
    } 
    double multiplicacion(){
      return this.n1*this.n2;
    } 
    double division(){
      return this.n1/this.n2;
    }
  }