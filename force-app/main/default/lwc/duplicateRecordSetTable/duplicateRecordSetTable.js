/**
 * Created by alexanderbelenov on 05.07.2022.
 */

import { api, LightningElement } from "lwc";
import columns from "./duplicateRecordSetTableColumns";

export default class DuplicateRecordSetTable extends LightningElement {
  columns = columns;

  totalRecords = 0;
  totalRecordCount = 0;
  @api duplicateRecordSetList = [];

  connectedCallback() {
    this.updateTotalRecords();
    this.updateTotalRecordCount();
  }

  handleRowAction(event) {
    if (event.detail.action.name === 'open_records') {
      // this.showModalWindow(event.detail.row.Id);
    } else if (event.detail.action.name ==='merge_records') {
      // this.runNewBatch(event.detail.row.Name);
    }
    console.log(event.detail.action.name);
  }

  updateTotalRecords() {
    this.totalRecords = (this.duplicateRecordSetList != null)? this.duplicateRecordSetList.length : 0
  }

  updateTotalRecordCount() {
    if (this.duplicateRecordSetList != null) {
      this.duplicateRecordSetList.forEach(el => this.totalRecordCount + parseInt(el));
    }
  }



}