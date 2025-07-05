trigger BikeTrigger on Bike__c (before delete) {
for(Bike__c bike:Trigger.old){
   Integer bookingCount=[select count() from Booking__c where Bike_Name__c=:bike.Id];
   if(bookingCount>0){
    bike.addError('Cannot delete this bike because it is being used on a booking!');
   }
}
}