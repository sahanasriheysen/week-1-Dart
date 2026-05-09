import 'dart:io';
mixin Logger {
  void log(String message)
  {
    print("[LOG]: $message");
  }
}

class Book
{
  final int id;
  final String title;
  final String author;
  bool _isAvailable = true;

  static final Map<int, Book> _cache = {};

  Book._internal(this.id, this.title, this.author);


  factory Book(int id, String title, String author)
  {
    if (_cache.containsKey(id))
    {
      return _cache[id]!;
    }
    else
    {
      final book = Book._internal(id, title, author);
      _cache[id] = book;
      return book;
    }
  }

  bool get isAvailable => _isAvailable;

  void borrowBook()
  {
    if (_isAvailable)
    {
      _isAvailable = false;
    }
    else
    {
      print("Book already borrowed");
    }
  }

  void returnBook()
  {
    _isAvailable = true;
  }

  void display()
  {
    print("ID: $id | $title by $author | Available: $_isAvailable");
  }
}


class User
{
  final int userId;
  final String name;

  List<Book> borrowedBooks = [];

  User(this.userId, this.name);

  void viewBooks()
  {
    print("$name has borrowed:");
    for (var b in borrowedBooks)
    {
      print("- ${b.title}");
    }
  }
}
class Member extends User with Logger
{
  Member(int id, String name) : super(id, name);

  void borrow(Book book)
  {
    if (book.isAvailable)
    {
      book.borrowBook();
      borrowedBooks.add(book);
      log("$name borrowed ${book.title}");
    } else {
      log("${book.title} is not available");
    }
  }

  void returnBook(Book book)
  {
    if (borrowedBooks.contains(book))
    {
      book.returnBook();
      borrowedBooks.remove(book);
      log("$name returned ${book.title}");
    }
  }
}


class Library with Logger
{
  List<Book> books = [];

  void addBook(Book book)
  {
    books.add(book);
    log("Book added: ${book.title}");
  }

  void showAvailableBooks()
  {
    print("\nAvailable Books:");
    for (var b in books)
    {
      if (b.isAvailable)
      {
        b.display();
      }
    }
  }
}


void main()
{
  Library lib = Library();

  var b1 = Book(1, "1984", "George Orwell");
  var b2 = Book(2, "Harry Potter", "J.K. Rowling");
  var b3 = Book(1, "1984", "George Orwell");

  lib.addBook(b1);
  lib.addBook(b2);
  lib.addBook(b3);

  Member user1 = Member(101, "Saha");

  lib.showAvailableBooks();

  print("\n--- Borrowing ---");
  user1.borrow(b1);
  user1.borrow(b2);

  lib.showAvailableBooks();

  print("\n--- Returning ---");
  user1.returnBook(b1);

  lib.showAvailableBooks();

  print("\n--- User Info ---");
  user1.viewBooks();
}
