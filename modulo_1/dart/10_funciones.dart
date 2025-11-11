void main() {
print(greetEveryone());
print (suma(3,4,));
print (addTwoNumbersOptional(6,8));
print (addTwoNumbersOptional(8));
print(greetPerson(name: "Rodriguez",message:"hasta la vista"));
print(greetPerson(name: "Juan"));
}

String greetEveryone()=>'hello everyone';

int suma (int a,int b)=>a+b;
int addTwoNumbersOptional(int a, [int b=0]){
  return  a+b;
}

String greetPerson({required String name, String message="hola"}){
  return '$message $name';
}