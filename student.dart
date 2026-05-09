import 'exceptions.dart';
class Student {
  final int rollNo;
  String name;
  List<double> marks;

  Student._(this.rollNo, this.name, this.marks);

  factory Student(int rollNo, String? name, List<double>? marks)
  {
    if (name == null || name.trim().isEmpty)
    {
      throw InvalidNameException("Name cannot be empty");
    }

    if (marks == null || marks.any((m) => m < 0))
    {
      throw InvalidMarksException("Marks must be non-negative");
    }

    return Student._(rollNo, name, marks);
  }

  double get average =>
      marks.isEmpty ? 0 : marks.reduce((a, b) => a + b) / marks.length;

  String get grade => average >= 90
      ? "A"
      : average >= 75
      ? "B"
      : average >= 50
      ? "C"
      : "F";

  void display() {
    print("Roll: $rollNo | Name: $name | Avg: ${average.toStringAsFixed(2)} | Grade: $grade");
  }
}
