import'dart:io';
class User
{
  String name;
  int age;

  User({required this.name, required this.age});
}

String getUserName(User? user)
{
  return user?.name.toUpperCase() ?? "GUEST";
}

class Profile
{
  late String bio;
  void setBio(String text)
  {
    bio = text;
  }

  void showBio()
  {
    print("Bio: $bio");
  }
}

int getNameLength(User? user)
{
  return user!.name.length;
}

void main()
{
  User? user;

  print(getUserName(user));

  user = User(name: "Saha", age: 21);

  print(getUserName(user));

  print("Name length: ${getNameLength(user)}");

  Profile p = Profile();
  p.setBio("Flutter Developer");
  p.showBio();

  String? city;
  city ??= "Chennai";
  print("City: $city");

  List<String?> names = ["Ram", null, "Saha"];

  for (var name in names) {
    print(name?.toUpperCase() ?? "UNKNOWN");
  }
}
