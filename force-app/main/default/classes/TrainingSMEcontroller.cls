public with sharing class TrainingSMEcontroller {
    @AuraEnabled(cacheable=true)
    public static List<Training__c> getTrainings(){
         return [SELECT Name,POC__c,Start_Date__c,End_Date__c,Training_Id__c from Training__c];
    }
   @AuraEnabled
   public static void addTrainings(String Poc,Date Start,String TraingingId,String Name,String smeName){
    //Training_SME__c training1=[select Id from Training_SME__c where Name=:Name];
    Training_SME__c training=new Training_SME__c();
    training.Point_Of_Contact__c=poc;
    training.Start_Date__c=start;
    training.TraingingId__c=TraingingId;
    training.Name=name;  
    SMEOBJECT__c sme=new SMEOBJECT__c();
    sme.Training_SME__c=training.Id;
    sme.Name=smeName;
    insert training;  
    insert sme; 
   }

}