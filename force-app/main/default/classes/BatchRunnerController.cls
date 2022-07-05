/**
 * Created by alexanderbelenov on 04.07.2022.
 */

public with sharing class BatchRunnerController implements Singleton {

    @AuraEnabled
    public static List<Id> runBatch() {
        return null;
    }

    @TestVisible
    private static Singleton instance;
    public static Singleton getInstance() {
        if (instance == null) {
            instance = new BatchRunnerController();
        }
        return instance;
    }

    public interface Singleton {
        Singleton getInstance();
    }
}