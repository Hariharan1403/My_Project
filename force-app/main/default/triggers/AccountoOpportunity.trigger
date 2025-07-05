//usecase: if account object record is created then opportunity record shoud aslo get created
trigger AccountoOpportunity on Account (after insert) {
    list<opportunity> oppList=new list<opportunity>();
    for(Account acc:Trigger.new){
        opportunity opp=new opportunity();
        opp.name=acc.name;
        opp.CloseDate=system.today();
        opp.StageName='prospecting';
        opp.AccountId=acc.id;    //relating opp with account object
        oppList.add(opp);
    }
    insert oppList;        //should not querry in for loop so out of the loop
}