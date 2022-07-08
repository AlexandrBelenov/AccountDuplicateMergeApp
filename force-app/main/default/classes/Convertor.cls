/**
 * Created by alexanderbelenov on 09.07.2022.
 */

public with sharing class Convertor {

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

    public static DuplicateRecordSetData convertCustomDuplicateRecordSetToDuplicateRecordSetData(CustomDuplicateRecordSet__c data) {
        if (data == null) return null;
        return new DuplicateRecordSetData(
                data.Id,
                data.Name,
                data.Record_Count__c
        );
    }

}