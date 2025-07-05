import { LightningElement,wire } from 'lwc';
import addTrainings from '@salesforce/apex/TrainingSMEcontroller.addTrainings';
import getTrainings from '@salesforce/apex/TrainingSMEcontroller.getTrainings';
import {refreshApex} from '@salesforce/apex';
export default class TraingingSME extends LightningElement {
    @wire(getTrainings) training;
    columns=[
        {label:'Name',fieldName:'Name'},
        {label:'Point Of Contact',fieldName:'POC__c'},
        {label:'Start Date',fieldName:'Start_Date__c'},
        {label:'End Date',fieldName:'End_Date__c'},
        {label:'Training Id',fieldName:'Training_Id__c'}
    ];
    Poc;
    startdate;
    trainingId;
    name;
    handlePoc(event){
        this.Poc=event.target.value;
    }
    handleStartDate(event){
        this.startdate=event.target.value;
    }
    handleId(event){ 
       this.trainingId=event.target.value;   
    }
    handleStartDate(event){
        this.startdate=event.target.value;
    }
    smeName;
    handleSME(event){
        this.smeName=event.target.value;
    }
    addTrainging(){
    addTrainings({Poc:this.Poc,Start:this.startdate,TraingingId:this.trainingId,Name:this.Name,smeName:this.smeName})
    .then((result)=>{
        refreshApex(this.training);

    })
    .catch()
    }
}