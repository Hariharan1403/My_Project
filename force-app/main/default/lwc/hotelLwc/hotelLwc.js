import { LightningElement,wire } from 'lwc';
import getAllCustomer from '@salesforce/apex/customerController.getAllCustomer';
import getBooking from '@salesforce/apex/customerController.getBooking'
export default class HotelLwc extends LightningElement {
    @wire(getAllCustomer) customers;
    searchKey;
    bookings;
    handleChange(event){
        this.searchKey=event.target.value;
    }
    handleBooking(){
        getBooking({Name:this.searchKey})
        .then((result)=>{
            if (result) {
                // convert data to json to insert custom field in the object
                let jsonData = JSON.parse(JSON.stringify(result));
               
                for (let account of jsonData) {
                    account.customerName = account.Customer1__r.Name;
                    account.roomNumber=account.Room__r.Name;
                   }
                this.bookings = jsonData;
                
            } else if (error) {
                console.log(error.detail.message);
            }
        })
        .catch()
    }
    columns=[
        {label:'Name',fieldName:'Name'},
        {label:'Last Name',fieldName:'Last_Name__c'},
        {label:'Email',fieldName:'Email__c'},
        {label:'Total Booking',fieldName:'Total_Number_of_Bookings__c'}
    ]
    columnsBooking=[
        {label:'Room Number',fieldName:'roomNumber'},
        {label:'Customer Name',fieldName:'customerName'},
        {label:'Check In Date',fieldName:'Check_In_Date__c'},
        {label:'Check Out Date',fieldName:'Check_Out_Date__c'},
        {label:'No Of Days',fieldName:'No_Of_Days__c'},
        {label:'Total Amount',fieldName:'Total_Amount__c'}
    ]

}