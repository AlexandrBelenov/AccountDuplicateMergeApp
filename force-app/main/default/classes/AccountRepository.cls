/**
 * Created by alexanderbelenov on 09.07.2022.
 */

public with sharing class AccountRepository {

    public static List<Account> getAccounts(Set<Id> accountIds) {
        if (accountIds == null || accountIds.isEmpty()) return new List<Account>();
        return [
                SELECT Id, Name, Phone, Website, Industry, BillingCity, BillingState
                FROM Account
                WHERE Id IN :accountIds
        ];
    }

}