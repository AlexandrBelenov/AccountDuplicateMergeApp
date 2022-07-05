// import df from '@salesforce/label/'
let columns = [
  {
    fieldName: 'Name',
    label: 'Duplicate Record Set Name',
    type: 'button',
    typeAttributes: {
      label: { fieldName: 'Name'},
      title: 'Click to View Details',
      name: 'open_records',
      variant: "base"
    }
  },
  {
    fieldName: 'RecordCount',
    label: 'Record Count',
    initialWidth: 150,
    type: 'String'
  },
  {
    label: '',
    hideLabel: true,
    type: 'button',
    initialWidth: 100,
    typeAttributes: {
      label: 'Merge',
      name: 'merge_records',
      title: 'Click to Merge',
      variant: "brand"
    }
  }
];

export default columns;