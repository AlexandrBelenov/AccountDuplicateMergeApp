import lClickToMerge from '@salesforce/label/c.Click_to_Merge'
import lClickToViewDetails from '@salesforce/label/c.Click_to_View_Details'
import lDuplicateRecordSetName from '@salesforce/label/c.Duplicate_Record_Set_Name'
import lRecordCount from '@salesforce/label/c.Record_Count'
import lMerge from '@salesforce/label/c.Merge'

let columns = [
  {
    fieldName: 'Name',
    label: lDuplicateRecordSetName,
    type: 'button',
    typeAttributes: {
      label: { fieldName: 'Name'},
      title: lClickToViewDetails,
      name: 'open_records',
      variant: "base"
    }
  },
  {
    fieldName: 'RecordCount',
    label: lRecordCount,
    initialWidth: 150,
    type: 'String'
  },
  {
    label: '',
    hideLabel: true,
    type: 'button',
    initialWidth: 100,
    typeAttributes: {
      label: lMerge,
      name: 'merge_records',
      title: lClickToMerge,
      variant: "brand"
    }
  }
];

export default columns;