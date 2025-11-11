void main() {
  
  print("Maps");
  
 final Map <String, dynamic> estudiante = {
   'name': 'sara loor',
   'edad':18,
   'inscrito': true,
   'documentos':{
     1: 'src/documento1.jpg',
     2:'str/documento2.jpg'
   }
 };
  print (estudiante);
  print (estudiante['name']);
  print (estudiante['edad']);
  print (estudiante['documentos']);
}
