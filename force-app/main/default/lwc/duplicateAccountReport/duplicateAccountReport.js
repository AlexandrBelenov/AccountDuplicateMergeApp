/**
 * Created by alexanderbelenov on 06.07.2022.
 */

import { LightningElement } from "lwc";
import runReport from '@salesforce/apex/ReportController.runReport'

export default class DuplicateAccountReport extends LightningElement {
  duplicateRecordSetList;
  error;

  handleClick() {
      runReport().then(result => {
        this.duplicateRecordSetList = result;
      }).catch(error => {
        this.error = error
        console.log(error)
      })
  }

}