public with sharing class DoctorController {
   @AuraEnabled(cacheable=true)
   public static List<Doc__c> getAllDoctors(String DocName){
    return [SELECT Name,Last_Name__c,Degree__c,Total_Number_of_Appointments__c from Doc__c where Name=:DocName with SECURITY_ENFORCED];
   }

   @AuraEnabled(cacheable=true)
   public static List<Appointment__c> getAppointments(String DocName){
    Doc__c doctorId= [SELECT Id from Doc__c where Name=:DocName];
    return [SELECT Name,Time_of_Appointment__c from Appointment__c where  Doctor__c=:doctorId.Id];
   }

  
}