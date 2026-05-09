import 'student.dart';
import 'logger_mixin.dart';

class StudentManager with Logger
{
  final List<Student> students = [];

  void addStudent(Student student)
  {
    students.add(student);
    log("Student added: ${student.name}");
  }

  void removeStudent(int rollNo)
  {
    students.removeWhere((s) => s.rollNo == rollNo);
    log("Student removed: $rollNo");
  }

  void searchByRoll(int rollNo)
  {
    var student = students.firstWhere(
          (s) => s.rollNo == rollNo,
      orElse: () => throw Exception("Student not found"),
    );
    student.display();
  }

  void searchByName(String name)
  {
    var results = students.where(
          (s) => s.name.toLowerCase().contains(name.toLowerCase()),
    );

    if (results.isEmpty)
    {
      print("❌ No student found");
    } else {
      results.forEach((s) => s.display());
    }
  }

  void showAllStudents({double? minAverage})
  {
    var filtered = [
      for (var s in students)
        if (minAverage == null || s.average >= minAverage) s
    ];

    if (filtered.isEmpty)
    {
      print("⚠️ No students available");
      return;
    }

    filtered.forEach((s) => s.display());
  }
}
