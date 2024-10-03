/* 
 * profile_fields.ts
 *     Created: 2024-10-03T20:55:46-04:00
 *    Modified: 2024-10-03T20:55:46-04:00
 *      Author: Justin Paul Chase <justin@justinwritescode.com>
 *   Copyright: © 2024 Justin Paul Chase, All Rights Reserved
 *     License: MIT (https://opensource.org/licenses/MIT)
 */
import type { RecordOf } from 'immutable';
import { List, Record as ImmutableRecord } from 'immutable';
import { UnionToTuple } from '../utils/unions-and-tuples-oh-my';

export interface ProfileFieldShape extends Required<ApiProfileFieldJSON> { }

export class ProfileField implements Required<ApiProfileFieldJSON> {
    _name: string | undefined = '';
    _field_type: ProfileFieldType = 'string';
    _value: string = '';
    _dropdown: boolean = false;
    _multiple: boolean = false;
    _description: string = '';
    _category: string = '';
    _first_person_singular_description: string = '';
    _second_person_singular_description: string = '';
    _third_person_masculine_description: string = '';
    _field_values: ProfileFieldValue[] = [];

    get name(): string { return this._name || ''; }
    get field_type(): ProfileFieldType { return this._field_type; }
    get value(): string { return this._value; }
    get dropdown(): boolean { return this._dropdown; };
    get multiple(): boolean { return this._multiple; };
    get description(): string { return this._description; };
    get category(): string { return this._category; };
    get first_person_singular_description(): string { return this._first_person_singular_description; };
    get second_person_singular_description(): string { return this._second_person_singular_description; };
    get third_person_masculine_description(): string { return this._third_person_masculine_description; };
    get field_values(): ProfileFieldValue[] { return this._field_values; };
    get default(): ProfileFieldValue { return this.field_values.find((fieldValue) => fieldValue.default) || this.field_values[0] || DefaultProfileFieldValue; };
}

const DefaultProfileFieldJSON: Required<ApiProfileFieldJSON> = {
    name: '',
    field_type: 'string',
    value: '',
    dropdown: false,
    multiple: false,
    description: '',
    category: '',
    first_person_singular_description: '',
    second_person_singular_description: '',
    third_person_masculine_description: '',
    field_values: [],
};

const DefaultProfileFieldValueJSON: ApiProfileFieldValueJSON = {
    order: 0,
    default: true,
    value: null,
    description: '',
    first_person_singular_description: '',
    second_person_singular_description: '',
    third_person_masculine_description: '',
    display_value: '',
    first_person_singular_display_value: '',
    second_person_singular_display_value: '',
    third_person_masculine_display_value: ''
}

const ProfileFieldShapeFactory = ImmutableRecord<ProfileFieldShape>(DefaultProfileFieldJSON as Required<ProfileFieldShape>);
const ProfileFieldFactory = ImmutableRecord<ProfileField>(DefaultProfileFieldJSON as Required<ProfileField>);

export function createProfileFieldShape(props: Partial<ProfileFieldShape>) {
    return ProfileFieldShapeFactory(props);
}
export function createProfileField(props: Partial<ProfileField>): ProfileField {
    return ProfileFieldFactory(props);
}

export class ProfileFields extends Array<ProfileField> {
    constructor(...fields: any[]) { super(...fields); }

    get categories(): string[] { return this.map((field) => field.category).filter((value, index, self) => self.indexOf(value) === index); }
    get fields(): ProfileField[] { return this; }
    get fieldsByCategory(): Record<string, ProfileField[]> {
        return this.reduce((acc: Record<string, ProfileField[]>, field) => {
            if (!acc[field.category]) acc[field.category] = [];
            acc[field.category!]?.push(field);
            return acc;
        }, {});
    }
}

const ProfileFieldValueFactory = ImmutableRecord<ProfileFieldValueShape>(DefaultProfileFieldValueJSON);

export function createProfileFieldValue(props: Partial<ProfileFieldValueShape>) {
    return ProfileFieldValueFactory(props);
}

const DefaultProfileFieldShape = createProfileFieldShape(DefaultProfileFieldJSON);
const DefaultProfileField = createProfileField(DefaultProfileFieldJSON);
const DefaultProfileFieldValue = createProfileFieldValue(DefaultProfileFieldValueJSON);

export type ProfileFieldType = 'string' | 'url' | 'date' | 'datetime' | 'float' | 'boolean' | 'object' | 'location' | 'integer';
export const ProfileFieldTypes: ProfileFieldType[] = ['string', 'url', 'date', 'datetime', 'float', 'boolean', 'object', 'location', 'integer'];

export type ApiProfileFieldJSON = {
    name: string | undefined;
    field_type: ProfileFieldType
    value: string | undefined;
    dropdown: boolean;
    description: string;
    // Removed unused constants
    multiple: boolean;
    category: string;
    first_person_singular_description: string;
    second_person_singular_description: string;
    third_person_masculine_description: string;
    field_values: ProfileFieldValue[];
};

export interface ProfileFieldValueShape extends Required<ApiProfileFieldValueJSON> {
};

export type ProfileFieldValue = RecordOf<ProfileFieldValueShape>;

export type ApiProfileFieldValueJSON = {
    order: number;
    default: boolean;
    value: string | null;
    description: string;
    first_person_singular_description: string;
    second_person_singular_description: string;
    third_person_masculine_description: string;
    display_value: string;
    first_person_singular_display_value: string;
    second_person_singular_display_value: string;
    third_person_masculine_display_value: string;
};
