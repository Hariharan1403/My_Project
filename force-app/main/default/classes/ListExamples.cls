public class ListExamples {
//syntax for list List<Datatype/sobjects> var=new List<Datatype/sobjects>();
public static void method()
{
List<string> var=new List<String>();
var.add('a');
var.add('e');
var.add('i');
    var.add('a');
System.debug(var.size());
system.debug(var.get(1));
system.debug(var);
}
}