//usecase : if account type is prospect then rating should be warm and industry should be chemical
trigger Insertevent on Account (before insert) {
    for(Account acc:trigger.new)
    {
        if(acc.type=='prospect')
        {
            acc.rating='warm';
            acc.industry='chemicals';
        }
    }
 
}