import { LightningElement,wire } from 'lwc';
import withdraw from '@salesforce/apex/BankAccountController.withdraw';
import deposit from '@salesforce/apex/BankAccountController.deposit';
import getAllAccounts from '@salesforce/apex/BankAccountController.getAllAccounts';
import {refreshApex} from '@salesforce/apex';
export default class BankLwc extends LightningElement {
    @wire(getAllAccounts) accounts;
    columns=[
        {label:'Name',fieldName:'Name'},
        {label:'Account Number',fieldName:'Account_Number__c'},
        {label:'Balance',fieldName:'Balance__c'},
        {label:'Account Type',fieldName:'Account_Type__c'},     
    ];
    amount;
    accNo;
    handleaccNo(event){
        this.accNo=event.target.value;
    }
    handleAmount(event){
        this.amount=event.target.value;
    }
    handleWithdraw(){
        withdraw({accNo:this.accNo,Amount:this.amount})
        .then((result)=>{
            alert('successfully withdrawn');
refreshApex(this.accounts);
        })
        .catch((error) => {
            // Show the error in an alert box
            alert('Error: ' + error.message);
            //console.error('Error: ', error.body.message);
        });
    } 
    handleDeposit(){
        deposit({accNo:this.accNo,Amount:this.amount})
        .then((result)=>{
            alert('successfully deposited');
            refreshApex(this.accounts);
                    })
                    .catch((error)=>{
                        alert(error.detail.message);
                    })
    }  
}