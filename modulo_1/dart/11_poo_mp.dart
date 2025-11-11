void main() {
final estudiante alumno =estudiante (name:'Sara loor',carrera: 'desarrollo de Software');
  print(alumno);
  print(alumno.name);
  print(alumno.carrera);
}
class estudiante{
  String name="" ;
  String carrera="";
  estudiante({
    required this.name,
    this.carrera="sin carrera asignada"});
  
    @override
    String toString(){
      return "$name- $carrera"; 
}
}