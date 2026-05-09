import 'dart:io';
void main()
{
  print("enter first number:");
  int a= int.parse(stdin.readLineSync()!);
  print("enter the second number:");
  int b=int.parse(stdin.readLineSync()!);
  print("choose operation(+,-,*,/):");
  String op=stdin.readLineSync()!;
  if (op=="+")
  {
    print("Result:${a + b}");
  }
  else if (op=="-")
  {
    print("Result:${a-b}");
  }
  else if (op=="*")
    {
      print("Result:${a*b}");
    }
  else if (op=="/")
    {
      print("Result:${a/b}");
    }
  else
    {
      print("invalid oprations");
    }

}