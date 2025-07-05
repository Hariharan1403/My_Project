trigger RoomTrigger on RoomBooking__c (after insert) {
    for(RoomBooking__c booking:Trigger.new){
        Room__c room=[SELECT Status__c FROM Room__c WHERE id=:booking.Room__c];
        room.Status__c='Booked';
        update room;
    }

}