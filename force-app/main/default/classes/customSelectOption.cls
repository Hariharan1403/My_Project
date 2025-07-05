public with sharing class customSelectOption {

    @AuraEnabled
    public string value{get;set;}
    @AuraEnabled
    public string label{get;set;}
    public customSelectOption(String val,String label) {
        this.label=label;
        this.value=val;
    }
}