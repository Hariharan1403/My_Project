public class DmlOperationEx {
//Method to insert the record
 public static void insertAccount(){
   Account acc=new Account();
   acc.Name='firstuser';
   insert acc;
   system.debug('Inserted account record'+acc);
 }
    //Method to update the existing record
 public static void updateAccount(Id AccountId){   //id is copied from search bar after selecting an record
   Account acc=[select id,name from account where id=:AccountId];
   acc.Name='Updated Acc Name';
   update acc;
   system.debug('updated account record'+acc);
 }
  public static void deleteAccount(Id AccountId){
   Account acc=[select id,name from account where id=:AccountId];
   delete acc;
   system.debug('delete existing record'+AccountId);
}
   public static void upsertMethod(id AccountId) //upsert=insert+update
   {
       Account acc=new Account();
       acc.id=accountid;
       acc.name='upserted account';     
       upsert acc;
       system.debug('upserted account'+acc);
   }
    public static void upsertMethod2(String accname) //upsert=insert+update
   {
       Account acc=new Account();
       acc.name=accname;
       acc.phone='8778998778';     
       upsert acc;
       system.debug('upserted account'+acc);
   }
}