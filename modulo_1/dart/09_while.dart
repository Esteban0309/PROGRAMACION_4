void main() {
  int n = 10;
  double tabla=3;
  int i=0;
 while (i<n){
   i++;
   print("$i * $tabla = ${i*tabla}");
 }
  i=1;
    do{
      print("$i * $tabla = ${i*tabla}");
      i++;
    }while (i<n);
}