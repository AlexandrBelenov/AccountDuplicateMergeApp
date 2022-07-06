/**
 * Created by alexanderbelenov on 06.07.2022.
 */
import { api, LightningElement} from "lwc";

export default class DuplicateRecordSetModal extends LightningElement {
  @api duplicateRecordSetId;
  currentStepNumber = 1;
  currentStepName;
  isFirstStep = false;
  isSecondStep = false;
  isThirdStep = false;

  constructor() {
    super();
    this.showCurrentStep();
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
    // save code here
    this.closeModal();
  }

  closeModal() {
    this.refreshStates();
    const closeEvent = new CustomEvent("closemodal", {
      detail: this.duplicateRecordSetId
    });
    this.dispatchEvent(closeEvent);
  }

  refreshStates() {
    this.currentStepNumber = 1;
    this.showCurrentStep()
  }

}