import flatpickr from "flatpickr"
import "flatpickr/dist/themes/material_blue.css" // A path to the theme CSS
import 'flatpickr/dist/l10n/fr.js';

flatpickr(".datepicker", {
  allowInput: true,
  altInput: true,
  altFormat: "j, F Y",
  dateFormat: "Y-m-d",
  defaultDate: 'today',
  locale: "fr",
})
