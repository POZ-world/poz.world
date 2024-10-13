# frozen_string_literal: true

class Api::Vnext::FaqsController < ApplicationController
  before_action :set_faq, only: [:show, :update, :destroy]

  # GET /api/vnext/faqs
  def index
    @faqs = Faq.ordered
    render json: @faqs, content_type: Faq.CONTENT_TYPE, each_serializer: FaqSerializer
  end

  # GET /api/vnext/faqs/:id
  def show
    render json: @faq, content_type: Faq.CONTENT_TYPE, serializer: FaqSerializer
  end

  # POST /api/vnext/faqs
  def create
    @faq = Faq.new(faq_params)
    if @faq.save
      render json: @faq, status: 201, location: api_vnext_faqs_faq_url(@faq)
    else
      render json: @faq.errors, status: 422
    end
  end

  # PATCH/PUT /api/vnext/faqs/:id
  def update
    if @faq.update(faq_params)
      render json: @faq, content_type: Faq.CONTENT_TYPE, serializer: FaqSerializer
    else
      render json: @faq.errors, status: 422
    end
  end

  # DELETE /api/vnext/faqs/:id
  def destroy
    @faq.destroy
    redirect_to faqs_url, notice: t('faqs.deleted')
  end

  private

  def set_faq
    @faq = Faq.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: t('faqs.not_found') }, status: 404
  end

  def faq_params
    params.require(:faq).permit(:question, :answer)
  end
end
