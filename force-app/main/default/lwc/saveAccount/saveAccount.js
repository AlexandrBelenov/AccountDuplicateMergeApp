/**
 * Created by alexanderbelenov on 10.07.2022.
 */

import { api, LightningElement } from "lwc";

export default class SaveAccount extends LightningElement {

  @api account;

  renderedCallback() {
    console.log(this.account);
  }

}