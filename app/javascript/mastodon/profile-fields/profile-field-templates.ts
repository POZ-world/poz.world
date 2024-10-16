import { apiRequestGet } from 'mastodon/api';
import { ApiProfileFieldJSON } from 'mastodon/models/profile-fields';
import { createProfileField } from 'mastodon/models/profile-fields';
import { Account } from '../models/account';

export const apiGetProfileFieldTemplates = async () =>
  (await apiRequestGet<ApiProfileFieldJSON[]>(`vnext/fields/templates/json`, {
  })).map(createProfileField);

export const apiGetUserAccount = async (id: string) => apiRequestGet<Account>(`v1/accounts/${id}`);