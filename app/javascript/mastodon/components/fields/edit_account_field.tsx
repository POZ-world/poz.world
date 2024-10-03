import { ProfileField } from 'mastodon/models/profile-fields';
import React, { useState, useEffect } from 'react';

export default function AccountField({ template }: { template: ProfileField }) {
    return (
        <div key={template.name} className="field-template">
            <h3>{template.name}</h3>
            <p>{template.description}</p>
            {template.dropdown ? (
                <select>
                    {template.field_values.sort(value => value.order).map((option, i) =>
                        (<option key={i} value={option.value || 'null'} title={option.second_person_singular_description}>{option.second_person_singular_display_value}</option>)
                    )}
                </select>
            ) : (
                <input type="text" defaultValue={template.default.second_person_singular_display_value} placeholder={template.default.second_person_singular_display_value} title={template.second_person_singular_description} />
            )}
        </div>
    );
}