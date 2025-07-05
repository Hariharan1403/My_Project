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
private class BikeTriggerTest {
 
    @isTest
    static void BikePassTest() {
        // TO DO: implement unit test
        Bike__c bike1=new Bike__c();
        bike1.Name='Apache';
        insert bike1;
        Rider__c rider=new Rider__c();
        rider.Name='Anil';
        insert rider;
        Booking__c booking=new Booking__c();
        booking.Bike_Name__c=bike1.Id;
        booking.Rider_Name__c=rider.Id;
        insert booking;
        try{
        delete bike1;
        }
        catch(Exception e)
        {
               Assert.isTrue(e.getMessage().contains('Cannot delete this bike because it is being used on a booking!'));
        }       
    }
    @isTest
    static void BikeFailTest() {
        // TO DO: implement unit test
        Bike__c bike1=new Bike__c();
        bike1.Name='Apache';
        insert bike1;
        delete bike1;
             
    }
}