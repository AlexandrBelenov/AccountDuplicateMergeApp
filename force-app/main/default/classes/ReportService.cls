/**
 * Created by alexanderbelenov on 07.07.2022.
 */

public with sharing class ReportService {

    public List<DuplicateRecordSetData> runReport() {
        List<DuplicateRecordSetData> recordDataList;
        try {
            FindDuplicatesJob duplicatesJob = new FindDuplicatesJob();
            duplicatesJob.run();


            recordDataList = new List<DuplicateRecordSetData>();
            recordDataList.add(new DuplicateRecordSetData('1', 'DRS-0000000001', 5));
            recordDataList.add(new DuplicateRecordSetData('2', 'DRS-0000000002', 10));
            recordDataList.add(new DuplicateRecordSetData('3', 'DRS-0000000003', 15));
            recordDataList.add(new DuplicateRecordSetData('4', 'DRS-0000000004', 20));
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }

        return recordDataList;
    }

}