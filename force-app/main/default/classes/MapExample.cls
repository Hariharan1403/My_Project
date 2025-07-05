public class MapExample {
    public static void mapfun(){
Map<integer,string> var=new Map<integer,string>();
    var.put(1,'a');
    var.put(2,'b');
    var.put(3,'c');
    var.put(4,'a');
    var.put(1,'d');
    system.debug(var.get(1));
}
}