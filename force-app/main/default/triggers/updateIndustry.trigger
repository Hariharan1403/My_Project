//usecase : if industry is change from consulting to chemicals then type should "customer - direct"
///in one object "Account" only changes and actions are happening so use "before"
trigger updateIndustry on Account (before update) {
    for(Account acc:trigger.new){ //use new because new value chemical is added 
        Account oldrec=trigger.oldMap.get(acc.Id);//same id only
        
        if(acc.Industry=='chemicals' && oldrec.Industry=='consulting'){
                      acc.Type='conducting - direct';
                   
        }
    }

}