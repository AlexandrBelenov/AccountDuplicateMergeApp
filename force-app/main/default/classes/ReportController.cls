/**
 * Created by alexanderbelenov on 07.07.2022.
 */

public with sharing class ReportController {

    private static ReportService reportCtrl = new ReportService();

    @AuraEnabled
    public static List<DuplicateRecordSetData> runReport() {
        List<DuplicateRecordSetData> result = reportCtrl.runReport();
        return result;
    }
    @AuraEnabled(Cacheable=true)
    public static List<DuplicateRecordItemData> getDuplicateRecordItems(Id duplicateRecordSetId) {
        System.debug(duplicateRecordSetId);
        List<DuplicateRecordItemData> result = reportCtrl.getDuplicateRecordItems(duplicateRecordSetId);
        System.debug(result);
        return result;
    }
}