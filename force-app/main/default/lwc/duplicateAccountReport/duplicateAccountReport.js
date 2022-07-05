/**
 * Created by alexanderbelenov on 06.07.2022.
 */

import { LightningElement } from "lwc";

export default class DuplicateAccountReport extends LightningElement {
  duplicateRecordSetList = []

  handleClick() {
    this.duplicateRecordSetList = [
      {
        Id: 0,
        Name: 'Sasha',
        RecordCount: 15
      },
      {
        Id: 1,
        Name: 'Masha',
        RecordCount: 10
      },
      {
        Id: 2,
        Name: 'Pasha',
        RecordCount: 5
      }
    ];
  }
}