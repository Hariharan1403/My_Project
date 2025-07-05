import { LightningElement,wire,api } from 'lwc';
import getAllBookings from '@salesforce/apex/BookingController.getAllBookings';
export default class BookingLWC extends LightningElement {
    bookings;
    @wire(getAllBookings)
    loadBooking({data,error}){
        if (data) {
            // convert data to json to insert custom field in the object
            let jsonData = JSON.parse(JSON.stringify(data));
           
            for (let account of jsonData) {
                account.riderName = account.Rider_Name__r.Name;
                account.bikeName=account.Bike_Name__r.Name;
               }
            this.bookings = jsonData;
            
        } else if (error) {
            console.log(error.detail.message);
        }
    }
    
    
    columns=[
        {label:'Name',fieldName:'Name'},
        {label:'Start Date',fieldName:'Start_Date__c'},
        {label:'End Date',fieldName:'End_Date__c'},
        {label:'Rider Name',fieldName:'riderName'},
        {label:'Bike Name',fieldName:'bikeName'},
    ]
}