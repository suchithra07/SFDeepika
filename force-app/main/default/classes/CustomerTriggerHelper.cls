//Helper class:Below code needs o be checked.
public class CustomerTriggerHelper
 {
    
    public static void isAfterUpdateCall(List<apex_customer__c> customerList,Map<id, apex_customer__c> newMapCustomer, Map<id, apex_customer__c> oldMapCustomer) {
        createInvoiceRecords(customerList,oldMapCustomer);//Method call
        updateCustomerDescription(customerList,newMapCustomer);
    }

    //Method To Create Invoice Records
    public static void createInvoiceRecords (List<apex_customer__c> customerList, Map<id, apex_customer__c> oldMapCustomer)
     {
            List<apex_invoice__c> InvoiceList = new List<apex_invoice__c>();
            for (APEX_Customer__c objCustomer: customerList)
             {
              if (objCustomer.APEX_Customer_Status__c == 'Active' && oldMapCustomer.get(objCustomer.id).APEX_Customer_Status__c == 'Inactive')
                    {      //condition to check the old value and new value
                        APEX_Invoice__c objInvoice = new APEX_Invoice__c();
                        objInvoice.APEX_Status__c = 'Pending';
                        objInvoice.APEX_Customer__c = objCustomer.id;
                        InvoiceList.add(objInvoice);
                    }
             }
            insert InvoiceList;//DML to insert the Invoice List in SFDC
    }

    //Method to update the invoice records
    public static void updateCustomerDescription (List<apex_customer__c> customerList,Map<id,apex_customer__c> newMapCustomer)
     {
       List<apex_Customer__c> CustomerListwithInvoice = [SELECT Id, Name,(select id,name, APEX_Description__c FROM Invoices__r) 
                                                           FROM apex_customer__c
                                                           WHERE id IN :newMapCustomer.keySet()];//nested queries
            
          List<apex_invoice__c> InvoiceListToUpdate = new List<apex_invoice__c>();  
          List<apex_invoice__c> InvList = CustomerListwithInvoice[0].Invoices__r;
            for (APEX_Invoice__c objInv: InvList) 
            {
                objInv.APEX_Description__c = 'OK To Pay';
                InvoiceListToUpdate.add(objInv);
             }
             update InvoiceListToUpdate;
        }
     
  }