/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an org are executed whenever Apex code is deployed
 * to a production org to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production org. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the org size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class banktest {

   // @isTest
    // static void getAllAccountsTest() {
    //     List<Bank_Account__c> acc=BankAccountController.getAllAccounts();
    //     System.Assert.isNotNull(acc);
    //     // TO DO: implement unit test
    // }
//     @isTest
//     static void getAccountTest() {
//         Bank_Account__c acc1=new Bank_Account__c();
//          acc1.Name='Shatrughna';
//          acc1.Account_Number__c='123';
//          acc1.Balance__c=100;
//          insert acc1;
//         Bank_Account__c acc=BankAccountController.getFoundAccount('123');
//         Assert.isNotNull(acc);
//         // TO DO: implement unit test
// }
@isTest()
static void depositAccountTest(){
    Bank_Account__c acc1=new Bank_Account__c();
         acc1.Name='Shatrughna';
         acc1.Account_Number__c='123';
         acc1.Balance__c=10000;
         insert acc1;
     boolean depositflag=BankAccountController.deposit('123',1000);
     Assert.isTrue(depositflag);   
} 

@isTest()
static void depositAccountFailedTest(){
    Bank_Account__c acc1=new Bank_Account__c();
         acc1.Name='Shatrughna';
         acc1.Account_Number__c='123';
         acc1.Balance__c=10000;
         insert acc1;
         try{
     boolean depositflag=BankAccountController.deposit('1234',1000);
         }catch(Exception e){
             //Assert.isTrue(e.getMessage().contains('No such account'));
     Assert.areEqual('No such account',e.getMessage());
         }
}
}
