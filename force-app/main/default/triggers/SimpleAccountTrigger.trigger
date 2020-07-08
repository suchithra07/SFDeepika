trigger SimpleAccountTrigger on Account (after insert)
{
    List<Contact> ContactList=new List<Contact>();
    for(Account ac:Trigger.new)
    {
        Contact objCon=new Contact();
        objCon.lastName=ac.Name;
        ContactList.add(objCon);
        
    }
insert ContactList;

}