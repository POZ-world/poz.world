# frozen_string_literal: true

class Api::Vnext::Fields::FieldValuesController < ApplicationController
  before_action :set_field_value, only: [:show, :update, :destroy]

  # GET /api/vnext/fields/field_values
  def index
    @field_values = FieldValue.all
    render json: @field_values
  end

  # GET /api/vnext/fields/field_values/:id
  def show
    render json: @field_value
  end

  # POST /api/vnext/fields/field_values
  def create
    @field_value = FieldValue.new(field_value_params)
    if @field_value.save
      render json: @field_value, status: 201
    else
      render json: @field_value.errors, status: 422
    end
  end

  # PATCH/PUT /api/vnext/fields/field_values/:id
  def update
    if @field_value.update(field_value_params)
      render json: @field_value
    else
      render json: @field_value.errors, status: 422
    end
  end

  # DELETE /api/vnext/fields/field_values/:id
  def destroy
    @field_value.destroy
    head 204
  end

  private

  def set_field_value
    @field_value = FieldValue.find(params[:id])
  end

  def field_value_params
    params.require(:field_value).permit(:name, :value, :field_id)
  end
end
