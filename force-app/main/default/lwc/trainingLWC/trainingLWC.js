import { LightningElement,wire } from 'lwc';
import getTrainings from '@salesforce/apex/TrainingController.getTrainings';
import addTraining from '@salesforce/apex/TrainingController.addTraining';
import { refreshApex } from '@salesforce/apex';
import addSME from '@salesforce/apex/TrainingController.addSME';
export default class TrainingLWC extends LightningElement {
    @wire(getTrainings)
    allTrainings;

    trainerName;
    poc;
    trainingId;
    trainingName;
    startDate;
    handlepoc(event){
        this.poc=event.detail.value;
    }
    handletrainerName(event){
        this.trainerName=event.detail.value;
    }
    handletrainingName(event){
        this.trainingName=event.detail.value;
    }
    handlestartDate(event){
        this.startDate=event.detail.value;
    }
    handletrainingId(event){
        this.trainingId=event.detail.value;
    }
    handleSubmit(){
addTraining({trainingName:this.trainingName,trainingId:this.trainingId,startDate:this.startDate,poc:this.poc,trainer:this.trainerName})
.then(()=>{
    refreshApex(this.allTrainings);
    console.log('sample');
    this.loadSmeName();
})
.catch()

    }
    columns=[
        {label:'Training Name',fieldName:'Name'},
        {label:'Training Id',fieldName:'Training_Id__c'},
        {label:'POC Name',fieldName:'POC__c'},
        {label:'Start Date',fieldName:'Start_Date__c'},
        {label:'End Date',fieldName:'End_Date__c'}
        
    ];
    smeName;
    handlesmeName(event){
this.smeName=event.detail.value;
    }
loadSmeName(){
    console.log(this.smeName+' '+this.trainerName);
    addSME({smeName:this.smeName,trainingName:this.trainingName})
    .then()
     .catch((error)=>{console.log('error!!')})
}

}