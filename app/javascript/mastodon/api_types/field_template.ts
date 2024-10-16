/* 
 * field_template.ts
 *     Created: 2024-09-18T05:23:19-04:00
 *    Modified: 2024-09-18T05:23:19-04:00
 *      Author: Justin Paul Chase <justin@justinwritescode.com>
 *   Copyright: © 2024 Justin Paul Chase, All Rights Reserved
 *     License: MIT (https://opensource.org/licenses/MIT)
 */ 

export interface FieldTemplateJSON
{
    name: string,
    description: string,
    options: FieldValueOptionJSON[],
    default_value: string,
    third_person_masculine_description: string,
    second_person_singular_description: string
}

export interface FieldValueOptionJSON
{
    value: string,
    description: string,
    default: boolean,
    third_person_masculine_description: string,
    second_person_singular_description: string,
    third_person_masculine_display_value: string,
    second_person_singular_display_value: string
}