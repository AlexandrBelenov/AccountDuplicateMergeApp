/**
 * Created by alexanderbelenov on 06.07.2022.
 */

import { LightningElement } from "lwc";
import runReport from '@salesforce/apex/ReportController.runReport';
import getDuplicateRecordSets from '@salesforce/apex/ReportController.getDuplicateRecordSets';

export default class DuplicateAccountReport extends LightningElement {
  duplicateRecordSetList;

  handleClick(e) {
      runReport().then(result => {
        this.duplicateRecordSetList = result;
      }).catch(error => {
        console.log(error)
      })
  }

  handleModalClosed(e) {
    getDuplicateRecordSets.then(result => {
      this.duplicateRecordSetList = result;
    }).catch(error => {
      console.log(error)
    })
  }
}