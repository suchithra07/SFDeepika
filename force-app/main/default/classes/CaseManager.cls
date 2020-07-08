@RestResource(urlMapping='/Cases/*')
global with sharing class CaseManager
{
    @HttpGet
    global static Case getCaseById()
    {
        RestRequest request=RestContext.request;
        String caseId=request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        //if url is like' /services/apexrest/cases/1150' here 1150 is Id. this 1150 id will be stored in CaseId
        
      	Case result=  [Select CaseNumber,subject,Status,Origin,Priority from Case where Id=:caseId];
        return result; 
       
    }
    @HttpPost
    global static Id createCase(String subj, String stats, String orign, String priorty)
    {
        Case thisCase=new Case(Subject=subj,Status=stats,Origin=orign,Priority=priorty);
        insert thisCase;
        return thisCase.Id;
    }
    
    @HttpDelete
    global static void deleteCase()
    {
         RestRequest req=RestContext.request;
       	 String caseId=req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        //if url is like' /services/apexrest/cases/1150' here 1150 is Id. this 1150 id will be stored in CaseId.extracting id val from url.
   		 
        Case delCase=[Select Id from case where id=:caseId];
        delete delCase;
        
    }
    @HttpPut
    global static ID upsertCase(String subj, String stats, String orign, String priorty,String id) 
    {
       Case thisCase=new Case(Id=id,Subject=subj,Status=stats,Origin=orign,Priority=priorty) ;
        upsert thisCase;
        return thisCase.Id;
        
    }
    @HttpPatch
    global static ID updateCaseFields()
    {
        RestRequest request=RestContext.request;
       	String caseId=request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        //if url is like' /services/apexrest/cases/1150' here 1150 is Id. this 1150 id will be stored in CaseId.extracting id val from url.
      
        Case thisCase=  [select Id from Case where Id=:caseId] ;
        Map<String,Object> params=( Map<String,Object>)JSON.deserializeUntyped(request.requestBody.toString());
        for(String fieldName:params.keySet())
        {
            thisCase.put(fieldName,params.get(fieldName));
        }
        update thiscase;
        return thisCase.id;
        
    }

}