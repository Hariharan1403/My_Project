public with sharing class BankController {
    
    // Bank Account inner class (for example purposes)
    public class BankAccount {
        public String accountHolderName { get; set; }
        public Decimal balance { get; set; }

        public BankAccount(String name, Decimal initialBalance) {
            accountHolderName = name;
            balance = initialBalance;
        }

        public void deposit(Decimal amount) {
            if (amount <= 0) {
                throw new IllegalArgumentException('Deposit amount must be positive');
            }
            balance += amount;
        }

        public void withdraw(Decimal amount) {
            if (amount > balance) {
                throw new IllegalArgumentException('Insufficient funds');
            }
            balance -= amount;
        }
    }

    public BankAccount account { get; private set; }

    // Constructor to initialize the account
    public BankController(String name, Decimal initialBalance) {
        account = new BankAccount(name, initialBalance);
    }

    // Public methods
    public void depositFunds(Decimal amount) {
        account.deposit(amount);
    }

    public void withdrawFunds(Decimal amount) {
        account.withdraw(amount);
    }

    public Decimal getBalance() {
        return account.balance;
    }
}
