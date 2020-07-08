public class exa
{
    
   
    public static void exmethod()
        
    {
		Integer first,second;
        try{
            list<integer> li=new  list<integer>();
            li.add(10);
            li.add(20);
            first=li[0];
            System.debug('element in first: '+first);
            System.debug('element at index 0: '+li[0]);
            System.debug('element at index 1: '+li[1]);
            System.debug('element at index 4: '+li[4]); 
            second=li[1];
        }
        catch (ListException e){
            system.debug('Exception occured :'+e.getMessage());
        }
    	System.debug('sec element in the list'+second);
    
        }
}