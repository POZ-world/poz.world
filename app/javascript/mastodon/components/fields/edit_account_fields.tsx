import React, { useState, useEffect } from 'react';
import { apiGetProfileFieldTemplates } from '../../profile-fields/profile-field-templates';
import { ApiProfileFieldJSON, ProfileField } from '../../models/profile-fields';
import Loading from '../loading';
import AccountField from './edit_account_field';

// Define a component that fetches field templates and manages them in state
const ProfileFields: React.FC = () => {
    const [fieldTemplates, setFieldTemplates] = useState<ProfileField[]>([]);
    const [loading, setLoading] = useState<boolean>(true);

    useEffect(() => {
        const fetchFieldTemplates = async () => {
            try {
                const response = await apiGetProfileFieldTemplates();
                setFieldTemplates(response as unknown as ProfileField[]);
            } catch (error) {
                console.error('Failed to fetch profile field templates:', error);
            } finally {
                setLoading(false);
            }
        }

        fetchFieldTemplates();
    }, []);

    if (loading) {
        return <Loading />;
    }

    return (
        <div className="profile-fields-form">
            {fieldTemplates.map((template) => (
                <div key={template.name} className="field-template">
                    <h3>{template.name}</h3>
                    <p>{template.description}</p>
                    <AccountField template={template} />
                </div>
            ))}
        </div>
    );
};

export default ProfileFields;
