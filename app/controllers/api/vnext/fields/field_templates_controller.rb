# frozen_string_literal: true

class Api::Vnext::Fields::FieldTemplatesController < ApplicationController
  before_action :set_field_template, only: [:show, :update, :destroy]

  # GET /api/vnext/fields/field_templates
  def index
    @field_templates = FieldTemplate.all
    render json: @field_templates, serializer: FieldTemplateSerializer
  end

  # GET /api/vnext/fields/field_templates/:id
  def show
    render json: @field_template
  end

  # POST /api/vnext/fields/field_templates
  def create
    @field_template = FieldTemplate.new(field_template_params)
    if @field_template.save
      render json: @field_template, status: 201
    else
      render json: @field_template.errors, status: 422
    end
  end

  # PATCH/PUT /api/vnext/fields/field_templates/:id
  def update
    if @field_template.update(field_template_params)
      render json: @field_template
    else
      render json: @field_template.errors, status: 422
    end
  end

  # DELETE /api/vnext/fields/field_templates/:id
  def destroy
    @field_template.destroy
    head 204
  end

  private

  def set_field_template
    @field_template = FieldTemplate.find(params[:id])
  end

  def field_template_params
    params.require(:field_template).permit(:name, :description, :field_type)
  end
end
