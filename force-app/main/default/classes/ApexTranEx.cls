public class ApexTranEx {
    
    public static void insertLeadandAccount(String accName,String LeadName,String LeadCompany)
    {
       Account a=New account(Name=accName) ;
        insert a;
        Lead l1=new Lead(LastName=LeadName,Company=LeadCompany);
        insert l1;
        Lead l2=new Lead(LastName=LeadName,Company='Myrack');
        insert l2;
        
    }

}