void main() {
  print("Mapas e Iterables - Sistema de Admisión");
  final puntajes = [800, 750, 900, 750, 820, 900, 900, 950, 950, 970, 980, 1000];
  print("Lista original de puntajes: $puntajes");
  print("Cantidad de postulantes: ${puntajes.length}");
  print("Puntaje del postulante en posición 4: ${puntajes[4]}");
  print("Primer puntaje registrado: ${puntajes.first}");
  final puntajesInvertidos = puntajes.reversed;
  print("Puntajes en orden inverso: $puntajesInvertidos");
  print("Lista (con duplicados): ${puntajesInvertidos.toList()}");
  print("Conjunto (sin duplicados): ${puntajesInvertidos.toSet()}");
}
