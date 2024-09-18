# frozen_string_literal: true

def render_static_page(action, dest:, **opts)
  html = ApplicationController.render(action, opts)
  File.write(dest, html)
end

namespace :assets do
  include ActionView::Helpers::AssetTagHelper
  include Webpacker::Helper
  desc 'Generate static pages'
  task generate_static_pages: :environment do
    render_static_page 'errors/400', layout: 'error', dest: Rails.public_path.join('assets', '400.html')
    render_static_page 'errors/401', layout: 'error', dest: Rails.public_path.join('assets', '401.html')
    render_static_page 'errors/403', layout: 'error', dest: Rails.public_path.join('assets', '403.html')
    render_static_page 'errors/404', layout: 'error', dest: Rails.public_path.join('assets', '404.html')
    render_static_page 'errors/406', layout: 'error', dest: Rails.public_path.join('assets', '406.html')
    render_static_page 'errors/409', layout: 'error', dest: Rails.public_path.join('assets', '409.html')
    render_static_page 'errors/410', layout: 'error', dest: Rails.public_path.join('assets', '410.html')
    render_static_page 'errors/418', layout: 'error', dest: Rails.public_path.join('assets', '418.html')
    render_static_page 'errors/422', layout: 'error', dest: Rails.public_path.join('assets', '422.html')
    render_static_page 'errors/429', layout: 'error', dest: Rails.public_path.join('assets', '429.html')
    render_static_page 'errors/500', layout: 'error', dest: Rails.public_path.join('assets', '500.html')
    render_static_page 'errors/502', layout: 'error', dest: Rails.public_path.join('assets', '502.html')
    render_static_page 'errors/503', layout: 'error', dest: Rails.public_path.join('assets', '503.html')
  end

  namespace :javascript do
    task precompile: :environment do
      desc 'Copy the "dynamic" JavaScript files to the output directory'
      Rails.public_path.join('packs/google_tag_manager.js').write(Js::GoogleTagManagerController.new.script_content)
      Rails.logger.info { 'google_tag_manager.js precompiled.' }
    end
  end

  namespace :missing_images do
    desc 'Dealing with images for "missing" elements'
    task copy_to_public: :environment do
      if File.exist?(avatar_source)
        FileUtils.cp(avatar_source, avatar_destination)
        Rails.logger.info { 'Missing avatar copied from the source directory.' }
      else
        Rails.logger.warn { 'Missing avatar was not found in the source directory; skipped.' }
      end

      if File.exist?(header_source)
        FileUtils.cp(header_source, header_destination)
        Rails.logger.info { 'Missing header copied from the source directory.' }
      else
        Rails.logger.warn { 'Missing header was not found in the source directory; skipped.' }
      end
    end
    # Rails.public_path.join('packs/identify_user.js').write(Js::AnalyticsIdentifyUserController.new.script_content)
  end
end

if Rake::Task.task_defined?('assets:precompile')
  Rake::Task['assets:precompile'].enhance do
    Webpacker.manifest.refresh
    Rake::Task['assets:generate_static_pages'].invoke
  end
end

if Rake::Task.task_defined?('assets:precompile')
  Rake::Task['assets:precompile'].enhance do
    Webpacker.manifest.refresh
    Rake::Task['assets:missing_images:copy_to_public'].invoke
  end
end

if Rake::Task.task_defined?('assets:precompile')
  Rake::Task['assets:precompile'].enhance do
    Webpacker.manifest.refresh
    Rake::Task['assets:javascript:precompile'].invoke
  end
end

private

def avatar_source
  Rails.root.join('app', 'javascript', 'images', 'defaults', 'avatars', 'missing.png')
end

def header_source
  Rails.root.join('app', 'javascript', 'images', 'defaults', 'headers', 'missing.png')
end

def avatar_destination
  Rails.public_path.join('avatars/original/missing.png')
end

def header_destination
  Rails.public_path.join('headers/original/missing.png')
end
