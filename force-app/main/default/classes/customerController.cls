public with sharing class customerController {
    @AuraEnabled(cacheable=true)
    public static List<Customer1__c> getAllCustomer() {
        return [SELECT Name,Last_Name__c,Email__c,Total_Number_of_Bookings__c from Customer1__c ];
    }
    @AuraEnabled
    public static List<RoomBooking__c> getBooking(String Name){
        return [select Customer1__r.Name,Room__r.Name,Check_In_Date__c,Check_Out_Date__c,No_Of_Days__c,Total_Amount__c from RoomBooking__c where Customer1__r.Name=:Name];
    }
}