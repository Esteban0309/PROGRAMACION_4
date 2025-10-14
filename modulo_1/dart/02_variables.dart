void main() {
  print("Tipos de Variables en Dart");
  
  final String pokemon ="Ditto";
  print(pokemon);
  String myName = "Esteban";
  myName = "Corella";
  print(myName);
  
  const String elemento ="Fuego";
  print("elemento: $elemento");
  
  bool active = false;
  active = false;
  print("Es activo: $active");
  
  int hp = 1000;
  print("Caballos de fuerza $hp");
  List<String> abilities=["impostor","corrlón"];
  print("habilidades $abilities"); 
  
  final sprites =<String>["src/image1.jpg",
                         "image2"];
  print("Imagenes $sprites");
  
  print("Impresion en varios lineas");
  print("""
  $pokemon
  $hp
  $sprites
  $abilities
  """);
}