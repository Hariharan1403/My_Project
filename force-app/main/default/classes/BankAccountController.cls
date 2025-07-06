public with sharing class BankAccountController {
    @AuraEnabled(cacheable=true)
    public static List<Bank_Account__c> getAllAccounts(){
        return [select Name,Account_Number__c,Balance__c,Account_Type__c from Bank_Account__c];
    }


    @AuraEnabled
     public static Bank_Account__c getFoundAccount(String accNo){
        Bank_Account__c foundAccount=null;
        try{
       foundAccount=[select Account_Number__c,Balance__c from Bank_Account__c where Account_Number__c=:accNo];
        }
        catch(Exception e){
            throw new InvalidAccountNumberException('No such account');
        }
        return foundAccount;    
     }
     @AuraEnabled
    public static boolean deposit(String accNo,Double Amount) {
        boolean depoistFlag=false;
        Bank_Account__c foundAccount=getFoundAccount(accNo);
        if(foundAccount!=null){
             foundAccount.Balance__c+=Amount;
             update foundAccount;
             depoistFlag=true;
        }
        return depoistFlag;
    }
    @AuraEnabled
    public static boolean withdraw(String accNo,Double Amount){
        boolean withdrawFlag=false;
        Bank_Account__c foundAccount=getFoundAccount(accNo);
        if(foundAccount!=null){
            if(foundAccount.Balance__c<Amount){
                throw new AuraHandledException('Insufficient Funds');
            }
            else{
             foundAccount.Balance__c-=Amount;
             update foundAccount;
             withdrawFlag=true;
        }
    }
    return withdrawFlag;
}
}
