/**
 * Created by alexanderbelenov on 07.07.2022.
 */

public with sharing class DuplicateRecordSetData {

    @AuraEnabled
    public String Id {set; get;}

    @AuraEnabled
    public String Name {set; get;}

    @AuraEnabled
    public Integer RecordCount {set; get;}

    public DuplicateRecordSetData(String id, String name, Integer recordCount) {
        this.Id = id;
        this.Name = name;
        this.RecordCount = recordCount;
    }

}