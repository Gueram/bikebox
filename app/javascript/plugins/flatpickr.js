import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

const contractForm = document.getElementById('contract-form-div');

if (contractForm) {
  const contracts = JSON.parse(contractForm.dataset.contracts);
  flatpickr("#range_start", {
    plugins: [new rangePlugin({ input: "#range_end" })],
    minDate: "today",
    inline: true,
    dateFormat: "Y-m-d",
    "disable": contracts,
  })
}