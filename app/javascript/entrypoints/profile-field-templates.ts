// /* 
//  * profile-field-templates.ts
//  *     Created: 2024-09-18T11:04:56-04:00
//  *    Modified: 2024-09-18T11:04:56-04:00
//  *      Author: Justin Paul Chase <justin@justinwritescode.com>
//  *   Copyright: © 2024 Justin Paul Chase, All Rights Reserved
//  *     License: MIT (https://opensource.org/licenses/MIT)
//  */ 

// import './public-path';
// import ready from '../mastodon/ready';
// import {apiGetFieldTemplates} from '../mastodon/api/fields'
// import { FieldTemplateJSON } from 'mastodon/api_types/field_template';
// export class ProfileFieldTemplatesLoadedEvent extends Event
// {
//     private _profileFieldTemplates!: FieldTemplateJSON[];

//     public get profileFieldTemplates(): FieldTemplateJSON[] { return this._profileFieldTemplates; }
//     public set profileFieldTemplates(profileFieldTemplates: FieldTemplateJSON[]) { this._profileFieldTemplates = profileFieldTemplates; }

//     constructor(profileFieldTemplates: FieldTemplateJSON[]) 
//     { 
//         super(ProfileFieldTemplatesLoadedEventName, { bubbles: true, cancelable: true, composed: false });
//         this.profileFieldTemplates = profileFieldTemplates; 
//     }
// };
// export const ProfileFieldTemplatesLoadedEventName: string = "ProfileFieldTemplatesLoadedEvent";

// export type ProfileFieldTemplatesAccessor = Window & { profileFieldTemplates: FieldTemplateJSON[]  };

// ready(async () => {
//     const profileFieldTemplates = await apiGetFieldTemplates();
//     window.dispatchEvent(new ProfileFieldTemplatesLoadedEvent(profileFieldTemplates));
// });