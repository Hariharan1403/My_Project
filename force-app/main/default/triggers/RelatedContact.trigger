//usecase: if account industry is changed from "banking" to "chemicals" then delele the related contacts
trigger RelatedContact on Account (after update) {//changes in one object and action in another object so after
    for(Account acc:trigger.new){
        Account oldrec=trigger.oldMap.get(acc.Id);//same id only
        if(acc.Industry=='chemicals' && oldrec.industry=='banking'){
            delete acc.contacts;
        }
    }
    
}