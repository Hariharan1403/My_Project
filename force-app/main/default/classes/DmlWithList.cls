public class DmlWithList {
public static void fun()
{
    List<Account> acc=new List<Account>();
Account acRec=new Account(); 
 acRec.Name ='AAA';
 acRec.Phone ='9786787658';
 acRec.Rating='cool';   //insert acRec; it will update in table directly
    acc.add(acRec);
Account acRec1=new Account(); 
acRec1.Name ='BBB';
 acRec1.Phone ='9786787658';
 acRec1.Rating='cool';
 acc.add(acRec1);
    system.debug(acc);
 insert acc;
}
}