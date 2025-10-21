void main() {
  final Hero wolverine = Hero(name: 'Logan', power:'Regeneracion');
  print(wolverine);
  print(wolverine.name);
  print(wolverine.power);
}

class Hero {
  String name = "";
  String power = "";
  Hero({required this.name, this.power = "sin poder"});

  @override
  String toString() {
    return "$name - $power";
  }
}
