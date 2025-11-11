void main() {
print(bienvenidaGeneral());
print (calcularPuntaje(8, 9));
print (calcularPuntajeOpcional(7, 8));
print (calcularPuntajeOpcional(9));
print(saludoEstudiante(name: "Rodriguez",message:"gracias por visitarnos"));
print(saludoEstudiante(name: "Sara"));
}

String bienvenidaGeneral()=>'bienvenido instituto educativo tu puntaje es :';

int calcularPuntaje (int nota1, int nota2)=>nota1+nota2;
int calcularPuntajeOpcional (int nota1, [int nota2=0]){
  return  nota1+nota2;
}

String saludoEstudiante({required String name, String message="hola"}){
  return '$message $name';
}