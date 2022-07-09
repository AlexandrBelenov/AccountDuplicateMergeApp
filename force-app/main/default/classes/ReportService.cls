/**
 * Created by alexanderbelenov on 07.07.2022.
 */

public with sharing class ReportService {

    public List<DuplicateRecordSetData> runReport() {
        List<DuplicateRecordSetData> result;
        try {
            FindDuplicatesJob duplicatesJob = new FindDuplicatesJob();
            duplicatesJob.run();

            List<CustomDuplicateRecordSet__c> customRecords = DuplicateRecordRepository.getCustomDuplicateRecordSet();
            result = Convertor.convertCustomDuplicateRecordSetToDuplicateRecordSetData(customRecords);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }

        return result;
    }

    public List<DuplicateRecordItemData> getDuplicateRecordItems(Id duplicateRecordSetId) {
        List<DuplicateRecordItemData> result;
        try {
            List<CustomDuplicateRecordItem__c> recordItems = DuplicateRecordRepository.getCustomDuplicateRecordItem(new Set<Id>{duplicateRecordSetId});
            Set<Id> accountIds = Convertor.getDuplicateRecordItemLinkedAccount(recordItems);
            List<Account> accounts = AccountRepository.getAccounts(accountIds);
            result = Convertor.convertAccountToDuplicateRecordItemData(accounts);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }

        return result;
    }

}