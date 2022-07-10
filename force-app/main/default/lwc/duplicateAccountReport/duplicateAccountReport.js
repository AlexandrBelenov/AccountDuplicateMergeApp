/**
 * Created by alexanderbelenov on 06.07.2022.
 */

import { LightningElement } from "lwc";
import runReport from '@salesforce/apex/ReportController.runReport';
import getDuplicateRecordSets from '@salesforce/apex/ReportController.getDuplicateRecordSets';
import runReportBatch from '@salesforce/apex/ReportController.runReportBatch'

export default class DuplicateAccountReport extends LightningElement {
  duplicateRecordSetList;
  batchId;

  handleRunReportBatch(e) {
      runReportBatch().then(result => {
        this.batchId = result;
      }).catch(error => {
        console.log(error)
      });
      console.log(this.batchId);
  }

  handleRefreshDuplicates(e) {
    getDuplicateRecordSets().then(result => {
      this.duplicateRecordSetList = result;
    }).catch(error => {
      console.log(error)
    })
  }

  handleRunReport(e) {
    runReport().then(result => {
      this.duplicateRecordSetList = result;
    }).catch(error => {
      console.log(error)
    })
  }

  handleModalClosed(e) {
    getDuplicateRecordSets().then(result => {
      this.duplicateRecordSetList = result;
    }).catch(error => {
      console.log(error)
    })
  }
}