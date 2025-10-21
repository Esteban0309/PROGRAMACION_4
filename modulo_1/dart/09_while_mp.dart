void main(){
  int n = 10;
  double tarifaDia = 20;
  int i = 0;
  
  while (i < n) {
    i++;
    print("$i día(s) * \$${tarifaDia} = \$${i * tarifaDia}");
  }
  
  i = 1;
  do {
    print("$i día(s) * \$${tarifaDia} = \$${i * tarifaDia}");
    i++;
  } while (i < n);
}
