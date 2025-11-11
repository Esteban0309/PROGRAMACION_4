void main() {
  print("Evaluación de requisitos - Sistema de Admisión");
  int puntaje = 80;

  if (puntaje > 90) {
    print('El puntaje $puntaje es excelente');
  }
  if (puntaje < 70) {
    print('El puntaje $puntaje es insuficiente');
  }
  if (puntaje == 80) {
    print('El puntaje $puntaje cumple el requisito mínimo');
  }
  if (puntaje > 80) {
    print('El puntaje es superior al requerido');
  } else {
    print('El puntaje es igual o inferior al mínimo requerido');
  }
  if (puntaje == 80) {
    print('El puntaje coincide con el mínimo de admisión');
  } else {
    print('El puntaje no coincide con el mínimo de admisión');
  }
  int edad = 18;
  if (edad > 18) {
    print('El aspirante es mayor de edad');
  } else if (edad < 18) {
    print('El aspirante es menor de edad');
  } else {
    print('El aspirante tiene exactamente 18 años');
  }

  String categoria = edad >= 18 ? 'Postulante adulto' : 'Postulante menor';
  print(categoria);
}
