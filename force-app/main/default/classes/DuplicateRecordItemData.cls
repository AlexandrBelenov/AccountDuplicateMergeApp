/**
 * Created by alexanderbelenov on 09.07.2022.
 */

public with sharing class DuplicateRecordItemData {

    @AuraEnabled
    public String Id {set; get;}

    @AuraEnabled
    public String Name {set; get;}

    @AuraEnabled
    public String Phone {set; get;}

    @AuraEnabled
    public String Website {set; get;}

    @AuraEnabled
    public String Industry {set; get;}

    @AuraEnabled
    public String BillingCity {set; get;}

    @AuraEnabled
    public String BillingState {set; get;}

    public DuplicateRecordItemData(String Id, String Name, String Phone,
            String Website, String Industry, String BillingCity, String BillingState) {
        this.Id = Id;
        this.Name = Name;
        this.Phone = Phone;
        this.Website = Website;
        this.Industry = Industry;
        this.BillingCity = BillingCity;
        this.BillingState = BillingState;
    }

}