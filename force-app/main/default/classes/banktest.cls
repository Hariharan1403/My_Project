@isTest
private class banktest {

    @isTest
    static void getAllAccountsTest() {
        Bank_Account__c acc1 = new Bank_Account__c(
            Name = 'Test 1',
            Account_Number__c = '111',
            Balance__c = 5000
        );
        insert acc1;

        List<Bank_Account__c> accounts = BankAccountController.getAllAccounts();
        System.assert(!accounts.isEmpty(), 'Accounts list should not be empty');
    }

    @isTest
    static void getAccountTest() {
        Bank_Account__c acc1 = new Bank_Account__c(
            Name = 'Test 2',
            Account_Number__c = '222',
            Balance__c = 1000
        );
        insert acc1;

        Bank_Account__c result = BankAccountController.getFoundAccount('222');
        System.assertNotEquals(null, result);
        System.assertEquals(1000, result.Balance__c);
    }

    @isTest
    static void depositAccountTest() {
        Bank_Account__c acc1 = new Bank_Account__c(
            Name = 'Test 3',
            Account_Number__c = '333',
            Balance__c = 10000
        );
        insert acc1;

        Boolean result = BankAccountController.deposit('333', 1000);
        System.assertEquals(true, result);

        Bank_Account__c updated = [SELECT Balance__c FROM Bank_Account__c WHERE Account_Number__c = '333'];
        System.assertEquals(11000, updated.Balance__c);
    }

    @isTest
    static void depositAccountFailedTest() {
    try {
        BankAccountController.deposit('9999', 1000);
        System.assert(false); // We should not reach here
    } catch (BankAccountController.InvalidAccountNumberException e) {
        System.assertEquals('No such account', e.getMessage());
    }
}

    @isTest
    static void withdrawSuccessTest() {
        Bank_Account__c acc = new Bank_Account__c(
            Name = 'Test 4',
            Account_Number__c = '444',
            Balance__c = 5000
        );
        insert acc;

        Boolean result = BankAccountController.withdraw('444', 1000);
        System.assertEquals(true, result);

        Bank_Account__c updated = [SELECT Balance__c FROM Bank_Account__c WHERE Account_Number__c = '444'];
        System.assertEquals(4000, updated.Balance__c);
    }

    @isTest
    static void withdrawInsufficientFundsTest() {
        Bank_Account__c acc = new Bank_Account__c(
            Name = 'Test 5',
            Account_Number__c = '555',
            Balance__c = 500
        );
        insert acc;

        try {
            BankAccountController.withdraw('555', 1000);
            System.assert(false); // should not reach here
        } catch (AuraHandledException e) {
            System.assertEquals('Insufficient Funds', e.getMessage());
        }
    }
}
