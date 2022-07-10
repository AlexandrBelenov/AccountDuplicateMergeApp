/**
 * Created by alexanderbelenov on 09.07.2022.
 */

public with sharing class DuplicateRecordRepository {

    public static List<CustomDuplicateRecordSet__c> getCustomDuplicateRecordSet() {
        return [
                SELECT Id, Name, Record_Count__c
                FROM CustomDuplicateRecordSet__c
        ];
    }

    public static List<CustomDuplicateRecordItem__c>  getCustomDuplicateRecordItem(Set<Id> parentIds) {
        if (parentIds == null || parentIds.isEmpty()) return new List<CustomDuplicateRecordItem__c>();
        return [
                SELECT Id, Name, CustomDuplicateRecordSet__c, Account__c
                FROM CustomDuplicateRecordItem__c
                WHERE CustomDuplicateRecordSet__c IN :parentIds
        ];
    }

    public static Set<CustomDuplicateRecordItem__c> getSomeCustomDuplicateRecordItem(Set<Id> recordItemIds) {
        if (recordItemIds == null || recordItemIds.isEmpty()) return new Set<CustomDuplicateRecordItem__c>();
        Set<CustomDuplicateRecordItem__c> ids = new Set<CustomDuplicateRecordItem__c>([
                SELECT Id, Name, CustomDuplicateRecordSet__c, Account__c
                FROM CustomDuplicateRecordItem__c
                WHERE Id IN :recordItemIds
        ]);
        return ids;
    }

    public static void insertCustomDuplicateRecordSet(List<CustomDuplicateRecordSet__c> objs) {
        insert objs;
    }

    public static void insertCustomDuplicateRecordItem(List<CustomDuplicateRecordItem__c> objs) {
        insert objs;
    }
}