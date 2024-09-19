import './public-path';
import ready from '../mastodon/ready';
import tippy from 'tippy.js';
import 'tippy.js/dist/tippy.css'; // optional for styling
import axios from 'axios';

ready(() => {
    // Initialize tooltips on page load
    tippy('[title]', {
        content(reference: any) {
            return reference.getAttribute('title');
        },
        placement: 'top',
    });

    // Prevent the default behavior for add-field button and add new fields
    const addFieldButton = document.querySelector<HTMLButtonElement>('.add-field-btn');

    if (addFieldButton) {
        addFieldButton.addEventListener('click', function (e) {
            console.log('Add Field button clicked');

            const fieldIndex = document.querySelectorAll('.new-fields-container .row').length
                + document.querySelectorAll('.fields-container .row').length;
            const newFieldHTML = `
            <div class="row">
                <input name="account[fields_attributes][${fieldIndex}][name]" placeholder="Field Name" maxlength="255" type="text" title="Enter Field Name" />
                <input name="account[fields_attributes][${fieldIndex}][value]" placeholder="Field Value" maxlength="255" type="text" title="Enter Field Value" />
                <input name="account[fields_attributes][${fieldIndex}][marked_for_deletion]" type="hidden" value="false" />
            </div>`;
            document.querySelector('.new-fields-container')?.insertAdjacentHTML('beforeend', newFieldHTML);

            console.log('New field #' + fieldIndex + ' added');

            // Initialize tooltips for dynamically added fields
            tippy('.new-fields-container .row [title]', {
                content(reference: any) {
                    return reference.getAttribute('title');
                },
                placement: 'top',
            });
        });
    } else {
        console.error('Add Field button not found');
    }
});