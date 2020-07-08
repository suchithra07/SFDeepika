//Batch Apex class for customers whose  is 'Active' , update desc and update status to paid  and send a email to developer

global class CustomerProcessingBatch implements Database.Batchable<sObject>
{
    global string[] email=new string[] {'laxmisg07@gmail.com'};
  
    //Start method
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
	   return Database.getQueryLocator('select id,name,apex_customer_status__c,apex_customer_description__c from apex_customer__c where apex_Active__c=true') ;       
    }

    //execute method
    global void execute (database.BatchableContext BC,list<sobject> scope)
     {
      List<apex_customer__c> updatedCustomerList=new List<apex_customer__c>();
         for(sobject objScope:scope)
         {
             Apex_customer__c newObjScope=(apex_customer__c)objScope;//since objscope is an sobject, cast it to customer object type
             newObjScope.APEX_Customer_Description__c='Updated Via batch job';
             newObjScope.APEX_Customer_Status__c='Paid';
             updatedCustomerList.add(newObjScope);
             System.debug('records updated: '+updatedCustomerList);  
         }
         //checking if the list is not empty means if it has some records
         if(updatedCustomerList!=Null && updatedCustomerList.size()>0)
         {
             Database.update(updatedCustomerList);
             System.debug('Records are successfully updated : '+updatedCustomerList);
             
         }
                          
    }        
     //finish method to send emails
    global void finish(Database.BatchableContext BC) 
    {
        Messaging.SingleEmailMessage mail= new messaging.SingleEmailMessage();
        AsyncApexJob a=[select a.TotalJobItems,a.Status,a.NumberOfErrors,a.JobType,a.JobItemsProcessed,a.Extendedstatus,a.createdById,a.completedDate
         from AsyncApexJob a
         where id=:BC.getJobId()
        ];  //all are available in AsyncApexJob Class
        System.debug('Job ID : '+BC.getJobId());
        mail.setToAddresses(email);
        mail.setReplyTo('laxmisg07@gmail.com');
        mail.setSenderDisplayName('Apex Batch Processing module');
        mail.setSubject('Batch processing :'+a.Status);
        mail.setPlainTextBody('The Batch Apex job Processed :' +a.TotalJobItems + '-batches with '+a.NumberOfErrors +
                             '-Failures -'+ 'Jobs processed are : '+a.JobItemsProcessed) ;
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
    }                      
                                        
}
//CustomerProcessingBatch ObjClass=new CustomerProcessingBatch();
//Database.executeBatch(ObjClass);