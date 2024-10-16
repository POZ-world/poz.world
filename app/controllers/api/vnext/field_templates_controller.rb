# frozen_string_literal: true

class Api::Vnext::FieldTemplatesController < ApplicationController
  include HumanizerHelper

  def index
    field_templates = FieldTemplate.all

    respond_to do |format|
      render json: field_templates, content_type: 'application/field-templates+json' # , each_serializer: FieldTemplateSerializer
      render js: js, content_type: 'application/javascript'
    end
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'FieldTemplates not found' }, status: 404
  end

  def index
    @field_templates = FieldTemplate.all
    respond_to do |format|
      format.html { render layout: 'admin' }
    end
  end

  def show
    if @field_template.nil?
      flash[:alert] = t('field_templates.not_found')
      redirect_to admin_field_templates_path
    else
      respond_to do |format|
        format.html { render layout: 'admin' }
      end
    end
  end

  def new
    @field_template = FieldTemplate.new
    render layout: 'admin'
  end

  def edit
    if @field_template.nil?
      flash[:alert] = t('field_templates.not_found')
      redirect_to admin_field_templates_path
    end
    render layout: 'admin'
  end

  def create
    @field_template = FieldTemplate.new(field_template_params)

    if @field_template.save
      redirect_to [:admin, @field_template], notice: t('field_templates.created')
    else
      respond_to do |format|
        format.html { render :new, layout: 'admin' }
      end
    end
  end

  def update
    if @field_template.nil?
      flash[:alert] = t('field_templates.not_found')
      redirect_to admin_field_templates_path
    elsif @field_template.update(field_template_params)
      respond_to do |format|
        format.html { redirect_to [:admin, @field_template], notice: t('field_templates.updated') }
      end
    else
      respond_to do |format|
        format.html { render :edit, layout: 'admin' }
      end
    end
  end

  def destroy
    if @field_template.nil?
      flash[:alert] = t('field_templates.not_found')
    else
      @field_template.destroy
      respond_to do |format|
        format.html { redirect_to admin_field_templates_url, notice: t('field_templates.destroyed') }
      end
    end
  end

  private

  def set_field_template
    @field_template = FieldTemplate.find_by(id: params[:id])
  end

  def field_template_params
    params.require(:field_template).permit(:name, :description, :dropdown, :multiple, :field_type, :category)
  end

  def js
    <<~JAVASCRIPT
      var json = document.getElementById('field-templates-json').innerText;
      window.field_templates = JSON.parse(json);
    JAVASCRIPT
  end
end
