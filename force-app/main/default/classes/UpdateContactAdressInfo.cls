global class UpdateContactAdressInfo implements Database.Batchable<sObject>
{

    global Database.QueryLocator start(Database.BatchableContext bc)
    {
        return Database.getQueryLocator('select id,BillingStreet,BillingCity,BillingState,BillingPostalCode,'+
                                     '(Select id,MailingStreet,MailingCity,MailingState,MailingPostalCode from Contacts) from Account'+
                                    ' where BillingState=\'TX\'');
    }
    global void execute(Database.BatchableContext bc,list<Account> scope)
    {
        List<Contact> contacts=new List<Contact>();
        for(Account account:scope)
        {
            for(Contact contact:account.contacts)
            {
                contact.MailingStreet=account.BillingStreet;
                contact.MailingCity=account.BillingCity;
                contact.MailingState=account.BillingState;
                contact.MailingPostalCode=account.BillingPostalCode;
                
                contacts.add(contact);//add the contact to the list created
                
            }
        }
        update contacts;
    }
    global void finish(Database.BatchableContext bc)
    {
        
        
    }
    
}