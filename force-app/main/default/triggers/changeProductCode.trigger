trigger changeProductCode on Product2 (before insert)
{
    
    List<Product2> prodList=Trigger.new;
    for(Product2 prod:prodList)
    {
        if(Prod.productCode!=null && prod.ProductCode!='')
        {
            prod.productCode='XYZ-' +prod.ProductCode;
        }
    
    
    }


}