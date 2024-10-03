// import './public-path';
// import ready from '../mastodon/ready';
// import tippy from 'tippy.js';
// import 'tippy.js/dist/tippy.css'; // optional for styling
// import axios from 'axios';

// ready(() => {
//     // Initialize tooltips on page load
//     tippy('[title]', {
//         content(reference: any) {
//             return reference.getAttribute('title');
//         },
//         placement: 'top',
//     });

//     // Prevent the default behavior for add-field button and add new fields
//     const addFieldButton = document.querySelector<HTMLButtonElement>('.add-field-btn');

//     if (addFieldButton) {
//         addFieldButton.addEventListener('click', function (e) {
//             console.log('Add Field button clicked');

//             const fieldIndex = document.querySelectorAll('.new-fields-container .row').length
//                 + document.querySelectorAll('.fields-container .row').length;
//             const newFieldHTML = `
//             <div class="row">
//                 <input name="account[fields_attributes][${fieldIndex}][name]" placeholder="Field Name" maxlength="255" type="text" title="Enter Field Name" />
//                 <input name="account[fields_attributes][${fieldIndex}][value]" placeholder="Field Value" maxlength="255" type="text" title="Enter Field Value" />
//                 <input name="account[fields_attributes][${fieldIndex}][marked_for_deletion]" type="hidden" value="false" />
//             </div>`;
//             document.querySelector('.new-fields-container')?.insertAdjacentHTML('beforeend', newFieldHTML);

//             console.log('New field #' + fieldIndex + ' added');

//             // Initialize tooltips for dynamically added fields
//             tippy('.new-fields-container .row [title]', {
//                 content(reference: any) {
//                     return reference.getAttribute('title');
//                 },
//                 placement: 'top',
//             });
//         });
//     } else {
//         console.error('Add Field button not found');
//     }

//     document.addEventListener('DOMContentLoaded', () => {
//         document.querySelectorAll<HTMLElement>('.delete-field').forEach((el) => {
//             const checkbox = el.querySelector<HTMLInputElement>('.delete-field-checkbox');
//             const deleteIcon = el.querySelector<HTMLElement>('.delete-icon');
//             const restoreIcon = el.querySelector<HTMLElement>('.restore-icon');

//             if (!checkbox || !deleteIcon || !restoreIcon) return;

//             checkbox.addEventListener('change', () => {
//                 if (checkbox.checked) {
//                     deleteIcon.style.display = 'none';
//                     restoreIcon.style.display = 'inline';
//                 } else {
//                     deleteIcon.style.display = 'inline';
//                     restoreIcon.style.display = 'none';
//                 }
//             });
//         });

//         document.querySelectorAll<HTMLElement>('.add-field-icon').forEach((el) => {
//             el.addEventListener('click', (event) => {
//                 const target = event.target as HTMLElement;
//                 const fieldContainer = target.closest('.row') as HTMLElement;
//                 const newField = fieldContainer.cloneNode(true) as HTMLElement;

//                 // Ensure the cloned fields' names and IDs are unique
//                 newField.querySelectorAll<HTMLInputElement | HTMLSelectElement>('input, select').forEach((input) => {
//                     const newId = `${input.id}_copy_${new Date().getTime()}`;
//                     input.id = newId;
//                     input.name = input.name.replace(/\[\d+]/, `[${Date.now()}]`);

//                     if (input.type !== 'checkbox') {
//                         input.value = '';
//                     } else {
//                         input.checked = false;
//                         const deleteIcon = newField.querySelector<HTMLElement>('.delete-icon');
//                         const restoreIcon = newField.querySelector<HTMLElement>('.restore-icon');
//                         if (deleteIcon) deleteIcon.style.display = 'inline';
//                         if (restoreIcon) restoreIcon.style.display = 'none';
//                     }
//                 });

//                 const parent = fieldContainer.parentNode;
//                 if (parent) {
//                     parent.insertBefore(newField, fieldContainer.nextSibling);
//                     newField.scrollIntoView({ behavior: 'smooth', block: 'nearest', inline: 'start' });
//                 }
//             });
//         });

//         document.querySelectorAll('.accordion-toggle').forEach(function(toggle) {
//             toggle.addEventListener('click', function(event) {
//               event.preventDefault();
//               var content = document.querySelector(this.dataset.target);
//               if (content.classList.contains('collapsed')) {
//                 content.classList.remove('collapsed');
//                 content.style.maxHeight = content.scrollHeight + 'px';
//               } else {
//                 content.classList.add('collapsed');
//                 content.style.maxHeight = null;
//               }
//             });
//         });
//     });
// });