/**
 * Created by alexanderbelenov on 06.07.2022.
 */
import { api, LightningElement} from "lwc";
import mergeAndSave from '@salesforce/apex/ReportController.mergeAndSave';

export default class DuplicateRecordSetModal extends LightningElement {
  @api duplicateRecordSetId;
  selectedAccounts;
  selectedMaster;
  notMasterAccount;
  mergedAccount;

  currentStepNumber = 1;
  currentStepName;
  isFirstStep = false;
  isSecondStep = false;
  isThirdStep = false;

  renderedCallback() {
    this.showCurrentStep();
  }

  handleRowsSelection(event) {
    this.selectedAccounts = event.detail;
  }

  handleMasterSelection(event) {
    if (event.detail && event.detail.length > 0) {
      this.selectedMaster = event.detail[0];
      this.mergeAccounts();
    }
  }

  mergeAccounts() {
    this.selectedAccounts.forEach(el => {
      if (el.Id !== this.selectedMaster.Id) {
        this.notMasterAccount = el;
      }
    });
    this.mergedAccount = {
      ...this.notMasterAccount,
      ...this.selectedMaster
    }
    console.log(this.mergedAccount);
  }

  showCurrentStep() {
    this.isFirstStep = this.currentStepNumber === 1;
    this.isSecondStep = this.currentStepNumber === 2;
    this.isThirdStep = this.currentStepNumber  === 3;
    this.currentStepName = 'step' + this.currentStepNumber;
  }

  nextStep() {
    this.currentStepNumber += 1;
    this.currentStepNumber = (this.currentStepNumber > 3)? 3 : this.currentStepNumber;
    this.showCurrentStep();
  }

  prevStep() {
    this.currentStepNumber -= 1;
    this.currentStepNumber = (this.currentStepNumber < 1)? 1 : this.currentStepNumber;
    this.showCurrentStep();
  }

  save() {
    mergeAndSave({
      masterAccount: this.selectedMaster.Id,
      mergeAccount: this.notMasterAccount.Id,
      duplicateRecordSetId: this.duplicateRecordSetId
    }).then(result => {
      this.closeModal();
    }).catch(error => {
      console.log(error)
    })

  }

  closeModal() {
    this.refreshStates();
    const closeEvent = new CustomEvent("closemodal", {});
    this.dispatchEvent(closeEvent);
  }

  refreshStates() {
    this.currentStepNumber = 1;
    this.showCurrentStep()
  }
}