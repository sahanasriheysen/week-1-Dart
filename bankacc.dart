import'dart:io';
class InsufficientBalanceException implements Exception
{
  final String message;

  InsufficientBalanceException(this.message);

  String toString() => "InsufficientBalanceException: $message";
}

class InvalidAmountException implements Exception
{
  final String message;

  InvalidAmountException(this.message);

  String toString() => "InvalidAmountException: $message";
}

class BankAccount
{
  final int accountNumber;
  final String holderName;
  double _balance;

  BankAccount(this.accountNumber, this.holderName, this._balance);

  double get balance => _balance;

  void deposit(double amount)
  {
    if (amount <= 0) {
      throw InvalidAmountException("Deposit amount must be greater than 0");
    }
    _balance += amount;
    print("Deposited: ₹$amount | New Balance: ₹$_balance");
  }

  void withdraw(double amount)
  {
    if (amount <= 0)
    {
      throw InvalidAmountException("Withdrawal amount must be greater than 0");
    }

    if (amount > _balance)
    {
      throw InsufficientBalanceException("Not enough balance");
    }

    _balance -= amount;
    print("Withdrawn: ₹$amount | Remaining Balance: ₹$_balance");
  }
}


void main()
{
  BankAccount acc = BankAccount(101, "Saha", 5000);

  try {
    acc.deposit(2000);
    acc.withdraw(3000);
    acc.withdraw(10000);
  } catch (e) {
    print("Error: $e");
  } finally {
    print("Transaction attempt completed");
  }

  print("Final Balance: ₹${acc.balance}");
}
