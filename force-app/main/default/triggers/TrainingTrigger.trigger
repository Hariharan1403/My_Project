trigger TrainingTrigger on SME_Object__c (before delete) {
for(SME_Object__c sme:Trigger.old){
    if(sme.Training_Name__c!=null){
        sme.Training_Name__c.addError('Deletion Cannot be performed');
    }
}
}