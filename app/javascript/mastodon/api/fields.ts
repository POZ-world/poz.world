/* 
 * fields.ts
 *     Created: 2024-09-18T05:25:52-04:00
 *    Modified: 2024-09-18T05:25:52-04:00
 *      Author: Justin Paul Chase <justin@justinwritescode.com>
 *   Copyright: © 2024 Justin Paul Chase, All Rights Reserved
 *     License: MIT (https://opensource.org/licenses/MIT)
 */

import { apiRequestGet } from 'mastodon/api';
import { Account } from 'mastodon/models/account';
import { ApiProfileFieldJSON, createProfileField, ProfileFields } from 'mastodon/models/profile-fields';
import { createAccountFromServerJSON } from 'mastodon/models/account';
import { ApiAccountJSON } from 'mastodon/api_types/accounts';
export const apiGetFieldTemplates = async () =>
  new ProfileFields((await apiRequestGet<ApiProfileFieldJSON[]>('vnext/fields/templates.json', {})).map(createProfileField));

export const apiGetAccount = async (id: string) =>
  (await apiRequestGet<ApiAccountJSON[]>(`v1/accounts/${id}`, {})).map(createAccountFromServerJSON).pop();

export async function apiGetCurrentUserAccount(): Promise<Account> {
  return (await apiGetAccount(window.currentlyLoggedInUserId || '')) as Account;
}

declare global {
  interface Window {
    currentlyLoggedInUserId?: string;
  }
}