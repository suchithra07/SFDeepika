trigger WinningOppStageTrigger on Opportunity (Before Update) 
{

    for(Opportunity Opp:Trigger.new)
    {
        Opportunity oldOpp=trigger.oldMap.get(Opp.Id);
        Boolean IsOldOppWon= oldOpp.StageName.equals('Closed Won');
        Boolean IsnewOppWon=Opp.StageName.equals('Closed Won');
            if(!IsOldOppWon && IsnewOppWon)
            {
                Opp.Is_Value_Correct__c=true;
            
            }
    }

}