public class TaskUtility 
{
	public static string getTaskProirity(String leadCountry)
    {
        if(String.isBlank(leadCountry)||leadCountry.length()>2)
        {
            return null;
        }	
    	String taskPriority;
        if(leadCountry=='US')
        {
            taskPriority='High';
        }else
        {
            taskPriority='Normal';
        }
    
        return taskPriority;
    }   
}