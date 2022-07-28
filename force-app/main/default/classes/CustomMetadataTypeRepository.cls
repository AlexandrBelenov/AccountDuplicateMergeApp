/**
 * Created by alexanderbelenov on 08.07.2022.
 */

public with sharing class CustomMetadataTypeRepository {

    public static Map<Id, Custom_Duplicate_Rule__mdt> getCustomDuplicateRule() {
        return new Map<Id, Custom_Duplicate_Rule__mdt>([
                SELECT Id, DeveloperName
                FROM Custom_Duplicate_Rule__mdt
        ]);
    }

    public static Map<Id, Custom_Matching_Rule__mdt> getCustomMatchingRule(Set<Id> ids) {
        return new Map<Id, Custom_Matching_Rule__mdt>([
                SELECT Id, Field_Name__c, Algorithm__c
                FROM Custom_Matching_Rule__mdt
                WHERE Custom_Duplicate_Rule__c IN :ids
        ]);
    }

}