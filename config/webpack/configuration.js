// Common configuration for webpacker loaded from config/webpacker.yml

/** 
 * @typedef {Object} Settings
 * @property {string} source_path
 * @property {string} source_entry_path
 * @property {string} public_root_path
 * @property {string} public_output_path
 * @property {string} cache_path
 * @property {boolean} check_yarn_integrity
 * @property {boolean} webpack_compile_output
 * @property {Array<string>} resolved_paths - Additional paths webpack should lookup modules
 * @property {boolean} cache_manifest - Reload manifest.json on all requests so we reload latest compiled packs
 * @property {boolean} extract_css - Extract and emit a css file
 * @property {Array<string>} static_assets_extensions
 * @property {Array<string>} extensions
 * @property {boolean} cache_manifest - Cache manifest.json for performance
 * @property {boolean} compile - Production depends on precompilation of packs prior to booting for performance.
 */

const { readFileSync } = require('fs');
const { resolve } = require('path');
const { env } = require('process');

const { load } = require('js-yaml');

const configPath = resolve('config', 'webpacker.yml');
/** @type {Settings} */
const settings = load(readFileSync(configPath), 'utf8')[env.RAILS_ENV || env.NODE_ENV];

const themePath = resolve('config', 'themes.yml');
/** @type {Map<string,string>} */
const themes = load(readFileSync(themePath), 'utf8');

const output = {
  path: resolve('public', settings.public_output_path),
  publicPath: `/${settings.public_output_path}/`,
};

module.exports = {
  settings,
  themes,
  env: {
    NODE_ENV: env.NODE_ENV,
    PUBLIC_OUTPUT_PATH: settings.public_output_path,
    MATOMO_ENABLED: env.MATOMO_ENABLED,
    GOOGLE_ANALYTICS_TRACKING_ID: env.GOOGLE_ANALYTICS_TRACKING_ID,
    GOOGLE_ANALYTICS_ENABLED: env.GOOGLE_ANALYTICS_ENABLED,
    GOOGLE_TAG_MANAGER_ID: env.GOOGLE_TAG_MANAGER_ID,
    GOOGLE_TAG_MANAGER_ENABLED: env.GOOGLE_TAG_MANAGER_ENABLED,
    WEB_DOMAIN: env.WEB_DOMAIN
  },
  output,
};
