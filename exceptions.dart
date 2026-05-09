class InvalidNameException implements Exception
{
  String message;
  InvalidNameException(this.message);

  @override
  String toString() => "InvalidNameException: $message";
}

class InvalidMarksException implements Exception
{
  String message;
  InvalidMarksException(this.message);

  String toString() => "InvalidMarksException: $message";
}
