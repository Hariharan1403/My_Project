trigger AvoidDelete on Contact (before delete) {
    for(contact con:trigger.old){
        if(con.AccountId!=null)
        {
         con.addError('you cannot delete');   
        }
    }
}