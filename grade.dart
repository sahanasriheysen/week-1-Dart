import'dart:io';

void main()
{
  Map<String, int> studentMarks = {};

  print("Enter number of subjects:");
  int n = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < n; i++) {
    print("\nEnter subject name:");
    String subject = stdin.readLineSync()!;

    print("Enter mark for $subject:");
    int mark = int.parse(stdin.readLineSync()!);

    studentMarks[subject] = mark;
  }

  List<int> marksList = studentMarks.values.toList();

  int total = 0;
  for (int mark in marksList) {
    total += mark;
  }

  double average = total / marksList.length;
  String grade;

  if (average >= 90) {
    grade = "A+";
  } else if (average >= 75) {
    grade = "A";
  } else if (average >= 60) {
    grade = "B";
  } else if (average >= 50) {
    grade = "C";
  } else {
    grade = "Fail";
  }
  
  print("\n===== RESULT =====");
  studentMarks.forEach((subject, mark) {
    print("$subject : $mark");
  });

  print("\nTotal = $total");
  print("Average = ${average.toStringAsFixed(2)}");
  print("Grade = $grade");
}
