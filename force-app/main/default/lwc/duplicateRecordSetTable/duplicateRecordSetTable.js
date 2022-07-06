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

  renderedCallback() {
    this.updateTotalRecords();
    this.updateTotalRecordCount();
  }

  handleRowAction(event) {
    if (event.detail.action.name === 'open_records') {

    } else if (event.detail.action.name ==='merge_records') {

    }
  }

  updateTotalRecords() {
    this.totalRecords = (this.duplicateRecordSetList != null)? this.duplicateRecordSetList.length : 0;
  }

  updateTotalRecordCount() {
    if (this.duplicateRecordSetList != null) {
      let sum = 0;
      this.duplicateRecordSetList.forEach(el => sum += el.RecordCount);
      this.totalRecordCount = sum;
    }
  }
}