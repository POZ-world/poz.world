# frozen_string_literal: true

module Admin
  class FaqsController < ApplicationController
    before_action :set_faq, only: [:show, :edit, :update, :destroy, :swap_positions]
    before_action :authorize_faq, only: [:create, :update, :destroy, :swap_positions] # Add authorization filter

    def index
      @faqs = Faq.ordered
      @faq = Faq.new
      render layout: 'admin' # This would override the default layout for this action only
    end

    def show; end

    def new
      @faq = Faq.new
      authorize @faq
      render layout: 'admin' # This would override the default layout for this action only
    end

    def edit
      render layout: 'admin'
    end

    def create
      @faq = Faq.new(faq_params)
      authorize @faq
      if @faq.save
        redirect_to admin_faqs_path, notice: t('admin.faqs.moderation_notes.created')
      else
        render :new, layout: 'admin'
      end
    end

    def update
      authorize @faq
      if @faq.update(faq_params)
        redirect_to admin_faqs_path, notice: t('admin.faqs.moderation_notes.updated')
      else
        render :edit, layout: 'admin'
      end
    end

    def destroy
      authorize @faq
      @faq.destroy
      redirect_to admin_faqs_path, notice: t('admin.faqs.moderation_notes.destroyed')
    end

    def swap_positions
      direction = params[:direction]

      if direction == 'up'
        target_faq = Faq.find_by(number: @faq.number - 1)
      elsif direction == 'down'
        target_faq = Faq.find_by(number: @faq.number + 1)
      end

      if target_faq.nil?
        Rails.logger.error "Target FAQ is nil. Direction: #{direction}, FAQ number: #{@faq.number}"
        redirect_to admin_faqs_path, alert: 'Unable to swap positions.'
        return
      end

      current_number = @faq.number

      Faq.transaction do
        target_number = target_faq.number
        target_faq.update!(number: 999_999_999)
        @faq.update!(number: target_number)
      end
      target_faq.update!(number: current_number)

      redirect_to admin_faqs_path, notice: 'Position swapped successfully.'
    end

    private

    def authorize_faq
      authorize @faq unless @faq.nil?
    end

    def set_faq
      @faq = Faq.find(params[:id])
    end

    def faq_params
      params.require(:faq).permit(:question, :answer)
    end
  end
end
