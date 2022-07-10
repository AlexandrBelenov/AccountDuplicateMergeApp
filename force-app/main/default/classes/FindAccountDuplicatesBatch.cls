/**
 * Created by alexanderbelenov on 06.07.2022.
 */

public with sharing class FindAccountDuplicatesBatch implements Database.Batchable<sObject>, Database.Stateful {

    private Map<Id, Custom_Matching_Rule__mdt> matchingRules;
    private String query;

    Map<String, List<Id>> rangedMap = new Map<String, List<Id>>();

    public FindAccountDuplicatesBatch(String query, Map<Id, Custom_Matching_Rule__mdt> matchingRules) {
        this.query = query;
        this.matchingRules = matchingRules;
    }

    public void execute(Database.BatchableContext context, List<sObject> scope) {
        for (SObject acc : scope) {
            String key = Utils.generateFieldValueKey(matchingRules.values(), (Account)acc);
            if (rangedMap.containsKey(key)) {
                rangedMap.get(key).add(acc.id);
            } else {
                List<Id> ids = new List<Id>();
                ids.add(acc.Id);
                rangedMap.put(key, ids);
            }
        }
    }

    public void finish(Database.BatchableContext param1) {
        Map<String, List<Id>> duplicates = new Map<String, List<Id>>();
        for (String key : rangedMap.keySet()) {
            if (rangedMap.get(key).size() > 1) {
                duplicates.put(key, rangedMap.get(key));
            }
        }

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

    public Database.QueryLocator start(Database.BatchableContext param1) {
        return Database.getQueryLocator(query);
    }
}