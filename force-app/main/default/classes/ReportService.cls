/**
 * Created by alexanderbelenov on 07.07.2022.
 */

public with sharing class ReportService {

    public List<DuplicateRecordSetData> runReport() {
        List<DuplicateRecordSetData> result;
        try {
            this.removeExistedCustomDuplicatesRecordSets();

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

    public void mergeAndSave(Id masterAccount, Id mergeAccount, Id duplicateRecordSetId) {
        try {
            List<CustomDuplicateRecordSet__c> duplicateRecordSets = DuplicateRecordRepository.getCustomDuplicateRecordSet(duplicateRecordSetId);
            DuplicateRecordRepository.removeCustomDuplicateRecordSet(duplicateRecordSets);

            Map<Id, Account> accountMap = new Map<Id, Account>(AccountRepository.getAccounts(new Set<Id>{masterAccount, mergeAccount}));
            AccountRepository.mergeAccounts(accountMap.get(masterAccount), accountMap.get(mergeAccount));
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    public List<DuplicateRecordSetData> getDuplicateRecordSets() {
        List<DuplicateRecordSetData> result;
        try {
            List<CustomDuplicateRecordSet__c> customRecords = DuplicateRecordRepository.getCustomDuplicateRecordSet();
            result = Convertor.convertCustomDuplicateRecordSetToDuplicateRecordSetData(customRecords);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }

        return result;
    }

    private void removeExistedCustomDuplicatesRecordSets() {
        List<CustomDuplicateRecordSet__c> recordSets = DuplicateRecordRepository.getCustomDuplicateRecordSet();
        DuplicateRecordRepository.removeCustomDuplicateRecordSet(recordSets);
    }

}