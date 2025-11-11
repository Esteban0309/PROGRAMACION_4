void main() {
  print("tipo de variable en dart, sitema de admision");
  final String estudiante ="Sara loor";
  print("estudiante:$estudiante");
  String carrera= 'desarrolo de software';
  carrera = "programacion";
  print(carrera);
  const String jornada ='vespertina';
  print("jornada: jornada");
  bool documentosCompletos = true;
  documentosCompletos = false;
  print("¿documentos completos?: $documentosCompletos");
  int puntaje =850;
  print ("puntaje: $puntaje");
  List<String> requisitos = ["Cédula", "Título de bachiller", "Foto tamaño carnet"];
  print("Requisitos entregados: $requisitos");
  final documentos = <String>["src/cedula.jpg","src/titulo.jpg"];
  print ("imagenes de documentos: $documentos");
  
  print("Resumen de admisión del estudiante:");
  print("""
  $estudiante
  $carrera
  $jornada
  $puntaje
  $documentos
  """);
}