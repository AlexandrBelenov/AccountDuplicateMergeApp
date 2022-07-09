/**
 * Created by alexanderbelenov on 07.07.2022.
 */

public with sharing class DuplicateRecordSetData {

    @AuraEnabled
    public Id Id {set; get;}

    @AuraEnabled
    public String Name {set; get;}

    @AuraEnabled
    public Decimal RecordCount {set; get;}

    public DuplicateRecordSetData(Id id, String name, Decimal recordCount) {
        this.Id = id;
        this.Name = name;
        this.RecordCount = recordCount;
    }

}