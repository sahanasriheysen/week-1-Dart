

double add(double a, double b) => a + b;

double subtract(double a, double b) => a - b;

double multiply(double a, double b) => a * b;

double divide(double a, double b) {
  if (b == 0) {
    throw Exception("Cannot divide by zero");
  }
  return a / b;
}

double power(double base, int exponent) {
  double result = 1;
  for (int i = 0; i < exponent; i++) {
    result *= base;
  }
  return result;
}

int factorial(int n) {
  if (n < 0) throw Exception("Negative number not allowed");

  int result = 1;
  for (int i = 1; i <= n; i++) {
    result *= i;
  }
  return result;
}

bool isPrime(int num) {
  if (num <= 1) return false;

  for (int i = 2; i <= num ~/ 2; i++) {
    if (num % i == 0) return false;
  }
  return true;
}

String evenOrOdd(int num) => (num % 2 == 0) ? "Even" : "Odd";

double average(List<double> numbers, {int precision = 2}) {
  double sum = numbers.reduce((a, b) => a + b);
  double avg = sum / numbers.length;

  return double.parse(avg.toStringAsFixed(precision));
}

Function createCounter() {
  int count = 0;

  return () {
    count++;
    return count;
  };
}


void main() {
  print(add(10, 5));           // 15
  print(subtract(10, 5));      // 5
  print(multiply(4, 3));       // 12
  print(divide(10, 2));        // 5

  print(power(2, 3));
  print(factorial(5));

  print(isPrime(7));
  print(evenOrOdd(10));

  print(average([10, 20, 30]));
  print(average([10, 20, 30], precision: 1));

  var counter = createCounter();
  print(counter());
  print(counter());
}
