void main() {
  
  print("Maps");
  
 final Map <String, dynamic> pokemon = {
   'name': 'Ditto',
   'hp':100,
   'isAlive': true,
   'sprites':{
     1: 'src/ditto1.jpg',
     2:'str/ditto2.jpg'
   }
 };
  print (pokemon);
  print (pokemon['name']);
  print (pokemon['sprites']);
  print (pokemon['isAlive']);
}
