# app/helpers/markdown_helper.rb
# frozen_string_literal: true

module MarkdownHelper
  @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, escape_html: true, no_images: true)

  def self.as_html(markdown_text)
    @markdown.render(markdown_text).html_safe # rubocop:disable Rails/OutputSafety
  end

  delegate :as_html, to: self
end
