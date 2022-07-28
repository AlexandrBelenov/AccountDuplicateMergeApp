/**
 * Created by alexanderbelenov on 09.07.2022.
 */

import { api, wire, LightningElement, track } from "lwc";
import getDuplicateRecordItems from "@salesforce/apex/ReportController.getDuplicateRecordItems";
import columns from './duplicateRecordItemTableColumns';

export default class DuplicateRecordItemSelect extends LightningElement {
  @api duplicateRecordSetId
  columns=columns
  @track duplicateRecordItemList = [];

  @wire(getDuplicateRecordItems, {duplicateRecordSetId:'$duplicateRecordSetId'})
  loadData({error, data}){
    if (data) {
      this.duplicateRecordItemList = data;
    } else if (error) {
      console.log(error);
    }
  }


  handleRowSelection(event) {
    if(event.detail.selectedRows) {
      const closeEvent = new CustomEvent("selectedrows", {
        detail: event.detail.selectedRows
      });
      this.dispatchEvent(closeEvent);
    }
  }
  disconnectedCallback() {
  }

}