public with sharing class TrainingController {
   @AuraEnabled(cacheable=true)
   public static List<Training__c> getTrainings(){
        return [SELECT Name,POC__c,Start_Date__c,End_Date__c,Training_Id__c from Training__c];
   }
   @AuraEnabled
    public static void addTraining(String trainingName, String trainingId, Date startDate, String poc,String trainer){
        try{
        Training__c newTraining = new Training__c();
        newTraining.Name = trainingName;
        newTraining.Training_Id__c = trainingId;
        newTraining.Start_Date__c = startDate;
        newTraining.POC__c = poc;
        insert newTraining;
        }catch(Exception e){
           throw new TrainingException('error msg');
        }

    }
    @AuraEnabled 
    public static void addSME(String smeName,String trainingName){
        try {
            Training__c trainingRec = [SELECT Id,Name,POC__c,Start_Date__c,End_Date__c,Training_Id__c from Training__c where Name =:trainingName LIMIT 1];
            SME_Object__c newSME = new SME_Object__c();
            newSME.Training_Name__c	 = trainingRec.Id;
            newSME.Name = smeName;
            insert newSME;
        } catch (Exception e) {
            throw new TrainingException('error msg');
        }
    }
}