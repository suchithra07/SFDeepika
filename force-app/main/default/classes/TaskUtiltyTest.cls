@isTest
public class TaskUtiltyTest 
{
	@isTest static void testGetTaskNormalPriority()
    {
        String priority =TaskUtility.getTaskProirity('AU');
        system.assertEquals('Normal', priority);
    }
    @isTest static void testGetTaskHighPriority()
    {
        String priority =TaskUtility.getTaskProirity('US');
        system.assertEquals('High', priority);
    }
    @isTest static void testGetTaskPriorityNull()
    {
        String priority =TaskUtility.getTaskProirity('Ind');
        system.assertEquals(null, priority);
    }
}