/**
 * Created by alexanderbelenov on 08.07.2022.
 */

public with sharing class FindDuplicatesJob {

    public void run() {
        Map<String, List<Id>> duplicateMap = this.find();
        this.saveDuplicateSets(duplicateMap);
    }

    private Map<String, List<Id>> find() {
        Map<Id, Custom_Duplicate_Rule__mdt> duplicateRules = CustomMetadataTypeRepository.getCustomDuplicateRule();
        Map<Id, Custom_Matching_Rule__mdt> matchingRules = CustomMetadataTypeRepository.getCustomMatchingRule(duplicateRules.keySet());

        Set<String> fields = Utils.getMatchingFields(matchingRules);
        Map<Id, SObject> accounts = new Map<Id, SObject>(
                Database.query(Utils.getAccountQuery(fields))
        );

        Map<String, List<Id>> rangedMap = new Map<String, List<Id>>();

        for (SObject acc : accounts.values()) {
            String key = Utils.generateFieldValueKey(matchingRules.values(), (Account)acc);
            if (rangedMap.containsKey(key)) {
                rangedMap.get(key).add(acc.id);
            } else {
                List<Id> ids = new List<Id>();
                ids.add(acc.Id);
                rangedMap.put(key, ids);
            }
        }

        Map<String, List<Id>> duplicates = new Map<String, List<Id>>();
        for (String key : rangedMap.keySet()) {
            if (rangedMap.get(key).size() > 1) {
                duplicates.put(key, rangedMap.get(key));
            }
        }

        return duplicates;
    }

    private void saveDuplicateSets(Map<String, List<Id>> duplicates) {
        if (duplicates == null) { return; }
        // create the Duplicate Record Sets
        List<CustomDuplicateRecordSet__c> customDuplicateRecordSets = new List<CustomDuplicateRecordSet__c>();
        for (Integer i = 0; i < duplicates.keySet().size(); i++) {
            customDuplicateRecordSets.add(new CustomDuplicateRecordSet__c());
        }
        DuplicateRecordRepository.insertCustomDuplicateRecordSet(customDuplicateRecordSets);

        // generate the DuplicateRecordItem
        List<List<Id>> idMatrix = duplicates.values();
        List<CustomDuplicateRecordItem__c> customDuplicateRecordItems = new List<CustomDuplicateRecordItem__c>();
        for (Integer i = 0; i < duplicates.keySet().size(); i++) {
            for (Integer j = 0; j < idMatrix.get(i).size(); j++) {
                CustomDuplicateRecordItem__c recordItem = new CustomDuplicateRecordItem__c(
                        CustomDuplicateRecordSet__c = customDuplicateRecordSets.get(i).Id,
                        Account__c = idMatrix.get(i).get(j)
                );
                customDuplicateRecordItems.add(recordItem);
            }

        }
        DuplicateRecordRepository.insertCustomDuplicateRecordItem(customDuplicateRecordItems);
    }

}