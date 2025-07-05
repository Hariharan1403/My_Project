import { LightningElement } from 'lwc';
import getAllDoctors from '@salesforce/apex/DoctorController.getAllDoctors';
import getAppointments from '@salesforce/apex/DoctorController.getAppointments';
export default class DoctorLWC extends LightningElement {
    docName;
    handledocName(event){
        this.docName=event.target.value;
    }
    
    appointments;
    doctors;
    columnsDoc=[{
    label: 'Name',fieldName: 'Name'},
    {label: 'Last Name',fieldName: 'Last_Name__c'},
    {label: 'Degree',fieldName: 'Degree__c'},
  {label: 'Total Number of Appointments',fieldName: 'Total_Number_of_Appointments__c'}        
];
columnsApp=[
    {label:'Appointment Number',fieldName:'Name'},
    {label: 'Time', fieldName: 'Time_of_Appointment__c', type: 'date', typeAttributes:{
        hour: '2-digit',
        minute: '2-digit',
        second: '2-digit',
        hour12: true,
        timeZone: 'UTC'
    }}
]
getDoctor(event){
    getAllDoctors({DocName:this.docName})
    .then((result)=>{
this.doctors=result;
    })
    .catch()
    getAppointments({DocName:this.docName})
    .then((result)=>{
        this.appointments=result;
    })
    .catch()
} 
}