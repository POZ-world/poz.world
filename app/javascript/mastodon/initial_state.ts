// @ts-check


export type InitialStateLanguage = [code: string, name: string, localName: string];

export type InitialStateMeta = {
  access_token: string;
  advanced_layout?: boolean;
  auto_play_gif: boolean;
  activity_api_enabled: boolean;
  admin: string;
  boost_modal?: boolean;
  delete_modal?: boolean;
  disable_swiping?: boolean;
  disable_hover_cards?: boolean;
  disabled_account_id?: string;
  display_media: string;
  domain: string;
  expand_spoilers?: boolean;
  limited_federation_mode: boolean;
  locale: string;
  mascot: string | null;
  me?: string;
  moved_to_account_id?: string;
  owner: string;
  profile_directory: boolean;
  registrations_open: boolean;
  reduce_motion: boolean;
  repository: string;
  search_enabled: boolean;
  trends_enabled: boolean;
  single_user_mode: boolean;
  source_url: string;
  timeline_preview: boolean;
  title: string;
  show_trends: boolean;
  trends_as_landing_page: boolean;
  use_blurhash: boolean;
  use_pending_items?: boolean;
  version: string;
  sso_redirect: string;
  [key: string | number | symbol]: any;
}

interface Role {
  id: string;
  name: string;
  permissions: string;
  color: string;
  highlighted: boolean;
}

interface InitialState {
  accounts: Record<string, import("./api_types/accounts").ApiAccountJSON>;
  languages: InitialStateLanguage[];
  critical_updates_pending: boolean;
  meta: InitialStateMeta;
  role?: Role;
}

const element = document.getElementById('initial-state');
/** @type {InitialState | undefined} */
const initialState: InitialState | undefined = element?.textContent && JSON.parse(element.textContent);

/** @type {string} */
const initialPath = document.querySelector("head meta[name=initialPath]")?.getAttribute("content") ?? '';
/** @type {boolean} */
export const hasMultiColumnPath = initialPath === '/'
  || initialPath === '/getting-started'
  || initialPath === '/home'
  || initialPath.startsWith('/deck');

/**
 * @template {keyof InitialStateMeta} K
 * @param {K} prop
 * @returns {InitialStateMeta[K] | undefined}
 */
const getMeta = (prop: string | number | symbol) => initialState?.meta && initialState.meta[prop];

export const activityApiEnabled = getMeta('activity_api_enabled');
export const autoPlayGif = getMeta('auto_play_gif');
export const boostModal = getMeta('boost_modal');
export const deleteModal = getMeta('delete_modal');
export const disableSwiping = getMeta('disable_swiping');
export const disableHoverCards = getMeta('disable_hover_cards');
export const disabledAccountId = getMeta('disabled_account_id');
export const displayMedia = getMeta('display_media');
export const domain = getMeta('domain');
export const expandSpoilers = getMeta('expand_spoilers');
export const forceSingleColumn = !getMeta('advanced_layout');
export const limitedFederationMode = getMeta('limited_federation_mode');
export const mascot = getMeta('mascot');
export const me = getMeta('me');
export const movedToAccountId = getMeta('moved_to_account_id');
export const owner = getMeta('owner');
export const profile_directory = getMeta('profile_directory');
export const reduceMotion = getMeta('reduce_motion');
export const registrationsOpen = getMeta('registrations_open');
export const repository = getMeta('repository');
export const searchEnabled = getMeta('search_enabled');
export const trendsEnabled = getMeta('trends_enabled');
export const showTrends = getMeta('show_trends');
export const singleUserMode = getMeta('single_user_mode');
export const source_url = getMeta('source_url');
export const timelinePreview = getMeta('timeline_preview');
export const title = getMeta('title');
export const trendsAsLanding = getMeta('trends_as_landing_page');
export const useBlurhash = getMeta('use_blurhash');
export const usePendingItems = getMeta('use_pending_items');
export const version = getMeta('version');
export const languages = initialState?.languages;
export const criticalUpdatesPending = initialState?.critical_updates_pending;
export const statusPageUrl = getMeta('status_page_url');
export const sso_redirect = getMeta('sso_redirect');

/**
 * @returns {string | undefined}
 */
export function getAccessToken(): string | undefined {
  return getMeta('access_token');
}

export default initialState || {};
