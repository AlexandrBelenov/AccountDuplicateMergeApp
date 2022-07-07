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
}