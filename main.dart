import 'dart:io';
import 'student.dart';
import 'student_manager.dart';

int? readInt()
{
  return int.tryParse(stdin.readLineSync() ?? "");
}

List<double>? readMarks()
{
  try
  {
    return stdin
        .readLineSync()
        ?.split(" ")
        .map((e) => double.parse(e))
        .toList();
  }
  catch (_)
  {
    return null;
  }
}

void main()
{
  final manager = StudentManager();

  while (true)
  {
    print("\n===== STUDENT MANAGEMENT SYSTEM =====");
    print("1. Add Student");
    print("2. Remove Student");
    print("3. Search by Roll No");
    print("4. Search by Name");
    print("5. Show All Students");
    print("6. Filter by Average");
    print("7. Exit");

    int? choice = readInt();

    try
    {
      switch (choice)
      {
        case 1:
          print("Enter Roll No:");
          int? roll = readInt();

          print("Enter Name:");
          String? name = stdin.readLineSync();

          print("Enter marks:");
          List<double>? marks = readMarks();

          if (roll == null) throw Exception("Invalid roll number");

          var student = Student(roll, name, marks);
          manager.addStudent(student);
          break;

        case 2:
          print("Enter Roll No:");
          int? roll = readInt();
          if (roll != null) manager.removeStudent(roll);
          break;

        case 3:
          print("Enter Roll No:");
          int? roll = readInt();
          if (roll != null) manager.searchByRoll(roll);
          break;

        case 4:
          print("Enter Name:");
          String name = stdin.readLineSync() ?? "";
          manager.searchByName(name);
          break;

        case 5:
          manager.showAllStudents();
          break;

        case 6:
          print("Enter minimum average:");
          double? avg = double.tryParse(stdin.readLineSync() ?? "");
          manager.showAllStudents(minAverage: avg);
          break;

        case 7:
          print("👋 Exit");
          return;

        default:
          print("❌ Invalid choice");
      }
    }
    catch (e)
    {
      print("⚠️ Error: $e");
    }
  }
}
