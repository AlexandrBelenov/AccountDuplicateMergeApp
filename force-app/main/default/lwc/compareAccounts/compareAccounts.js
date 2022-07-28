/**
 * Created by alexanderbelenov on 10.07.2022.
 */

import { LightningElement, api } from "lwc";
import columns from "./mergeTableColumns.js";

export default class CompareAccounts extends LightningElement {

  @api selectedAccounts;
  columns = columns;

  handleRowSelection(event) {
    if(event.detail.selectedRows) {
      const closeEvent = new CustomEvent("masterselected", {
        detail: event.detail.selectedRows
      });
      this.dispatchEvent(closeEvent);
    }
  }

}