import 'dart:io';
void main() {
  print("Enter the temperature in celsius:");
  double C = double.parse(stdin.readLineSync() ?? "0");
  double f = (C * 9 / 5) + 32;
  print("temperature in farenheit:$f");
  if (C < 10) {
    print("status:too cold");
  }
  else if(C>=10 && C <=30)
    {
      print("status:normal");
    }
  else if (C>30 && C<=40)
    {
      print("status:hot");
    }
  else
    {
      print("status:extreme hot");
    }


  }