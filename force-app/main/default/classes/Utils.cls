/**
 * Created by alexanderbelenov on 08.07.2022.
 */

public with sharing class Utils {
    public static String fuzzyConversion(String text) {
        return text.replaceAll('[^a-zA-Z0-9\\+]', '').toUpperCase();
    }

    public static String getAccountQuery(Set<String> fields) {
        return 'SELECT ' + fields.toString().replaceAll('[{}]', '') + ' FROM Account';
    }

    public static String generateFieldValueKey(List<Custom_Matching_Rule__mdt> matchingRules, Account account) {
        String resultString = '';
        for (Custom_Matching_Rule__mdt matchingRule : matchingRules) {
            String fieldName = matchingRule.Field_Name__c;

            Object rawValue = account.get(fieldName);
            Object fieldValue = (rawValue == null)? '' : rawValue;
            if (matchingRule.Algorithm__c == Constants.COMPARE_METHOD_FUZZY) {
                if (fieldValue instanceof String) {
                    fieldValue = Utils.fuzzyConversion((String)fieldValue);
                }
            }
            resultString += fieldName + '-' + fieldValue + ',';
        }
        return resultString;
    }

    public static Set<String> getMatchingFields(Map<Id, Custom_Matching_Rule__mdt> matchingRules) {
        Set<String> fields = new Set<String>();
        for (Custom_Matching_Rule__mdt matchingRule : matchingRules.values()) {
            fields.add(matchingRule.Field_Name__c);
        }
        return fields;
    }
}