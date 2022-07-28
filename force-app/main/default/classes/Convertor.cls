/**
 * Created by alexanderbelenov on 09.07.2022.
 */

public with sharing class Convertor {

    public static DuplicateRecordSetData convertCustomDuplicateRecordSetToDuplicateRecordSetData(CustomDuplicateRecordSet__c data) {
        if (data == null) return null;
        return new DuplicateRecordSetData(
                data.Id,
                data.Name,
                data.Record_Count__c
        );
    }
    public static List<DuplicateRecordSetData> convertCustomDuplicateRecordSetToDuplicateRecordSetData(List<CustomDuplicateRecordSet__c> dataList) {
        if (dataList == null) return new List<DuplicateRecordSetData>();

        final List<DuplicateRecordSetData> result = new List<DuplicateRecordSetData>();
        for (CustomDuplicateRecordSet__c customDuplicateRecordSet : dataList) {
            DuplicateRecordSetData converted = convertCustomDuplicateRecordSetToDuplicateRecordSetData(customDuplicateRecordSet);
            if (converted != null) {
                result.add(converted);
            }
        }
        return result;
    }

    public static DuplicateRecordItemData convertAccountToDuplicateRecordItemData(Account data) {
        if (data == null) return null;
        return new DuplicateRecordItemData(
                data.Id,
                data.Name,
                data.Phone,
                data.Website,
                data.Industry,
                data.BillingCity,
                data.BillingState
        );
    }
    public static List<DuplicateRecordItemData> convertAccountToDuplicateRecordItemData(List<Account> dataList) {
        if (dataList == null) return new List<DuplicateRecordItemData>();

        final List<DuplicateRecordItemData> result = new List<DuplicateRecordItemData>();
        for (Account account : dataList) {
            DuplicateRecordItemData converted = convertAccountToDuplicateRecordItemData(account);
            if (converted != null) {
                result.add(converted);
            }
        }
        return result;
    }

    public static Set<Id> getDuplicateRecordItemLinkedAccount(List<CustomDuplicateRecordItem__c> items) {
        if (items == null || items.isEmpty()) return new Set<Id>();
        Set<Id> accountsIds = new Set<Id>();
        for (CustomDuplicateRecordItem__c recordItem : items) {
            accountsIds.add(recordItem.Account__c);
        }
        return accountsIds;
    }
}