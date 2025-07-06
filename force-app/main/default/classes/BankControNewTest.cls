@isTest
private class BankControllerTest {

    @isTest
    static void testBankControllerOperations() {
        // Create BankController instance
        BankController controller = new BankController('Alice', 1000);

        // Test initial balance
        System.assertEquals(1000, controller.getBalance(), 'Initial balance should be 1000');

        // Test deposit
        controller.depositFunds(500);
        System.assertEquals(1500, controller.getBalance(), 'Balance after deposit should be 1500');

        // Test withdraw
        controller.withdrawFunds(300);
        System.assertEquals(1200, controller.getBalance(), 'Balance after withdrawal should be 1200');
    }

    @isTest
    static void testNegativeDeposit() {
        BankController controller = new BankController('Bob', 200);
        try {
            controller.depositFunds(-100);
            System.assert(false, 'Negative deposit should throw an exception');
        } catch (Exception e) {
            System.assertEquals('Deposit amount must be positive', e.getMessage());
        }
    }

    @isTest
    static void testInsufficientFundsWithdrawal() {
        BankController controller = new BankController('Charlie', 100);
        try {
            controller.withdrawFunds(200);
            System.assert(false, 'Over-withdrawal should throw an exception');
        } catch (Exception e) {
            System.assertEquals('Insufficient funds', e.getMessage());
        }
    }
}
