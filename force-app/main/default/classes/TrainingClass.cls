public class TrainingClass {
    
    public static void insertexample(){
         List<Account> acc=[Select id from Account limit 20];
        System.debug(acc[0].Name);
    }
}