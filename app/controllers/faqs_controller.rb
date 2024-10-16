# frozen_string_literal: true

class FaqsController < ApplicationController
  def index
    @faqs = Faq.ordered
    @faq = Faq.new
  end

  def show
    @faq = Faq.find(params[:id])
  end
end
