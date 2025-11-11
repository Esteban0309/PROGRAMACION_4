void main() {
  print("tipo de variable en dart");
  final String pokemon ="Ditto";
  print(pokemon);
  String myName= 'Sandra';
  myName = "Rodriguez";
  print(myName);
  const String elemento ='fuego';
  print("elemento: $elemento");
  bool active =false;
  active = false;
  print ("es activo: $active");
  int hp =1000;
  print ("caballo de fuerza $hp");
  List<String>abilities=["impostor","correlón"];
  print ("habilidades $abilities");
  final sprites = <String>["src/image1.jpg","imagen2"];
  print ("imagenes $sprites");
  
  print("impresion en varias lineas");
  print("""
  $pokemon
  $hp
  $sprites
  $abilities
  """);
}