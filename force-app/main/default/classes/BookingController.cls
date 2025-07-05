public with sharing class BookingController {
    
    @AuraEnabled(cacheable=true)
    public static List<Booking__c> getAllBookings(){
        return [SELECT Name,Start_Date__c,End_Date__c,price__c,Rider_Name__r.Name,Bike_Name__r.Name
        from Booking__c];
}
}