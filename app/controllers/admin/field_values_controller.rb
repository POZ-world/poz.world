# frozen_string_literal: true

module Admin
  class FieldValuesController < ApplicationController
    include HumanizerHelper

    before_action :ensure_field_template, only: %i(new create)
    before_action :ensure_field_value, only: %i(show edit update destroy)

    def index
      @field_values = FieldValue.all
      respond_to do |format|
        format.html
      end
      render layout: 'admin'
    end

    def show
      render layout: 'admin'
    end

    def new
      field_value_params[:first_person_singular_description] = translate(field_value_params[:description], :first_singular)
      field_value_params[:first_person_singular_display_value] = translate(field_value_params[:display_value], :first_singular)
      field_value_params[:second_person_singular_description] = translate(field_value_params[:description], :second_singular)
      field_value_params[:second_person_singular_display_value] = translate(field_value_params[:display_value], :second_singular)
      field_value_params[:third_person_masculine_description] = translate(field_value_params[:description], :third_singular_masculine)
      field_value_params[:third_person_masculine_display_value] = translate(field_value_params[:display_value], :third_singular_masculine)

      @field_value = @field_template.field_values.new(field_value_params)
      render layout: 'admin'
    end

    def edit
      render layout: 'admin'
    end

    def create
      field_value_params[:first_person_singular_description] = translate(field_value_params[:description], :first_singular)
      field_value_params[:first_person_singular_display_value] = translate(field_value_params[:display_value], :first_singular)
      field_value_params[:second_person_singular_description] = translate(field_value_params[:description], :second_singular)
      field_value_params[:second_person_singular_display_value] = translate(field_value_params[:display_value], :second_singular)
      field_value_params[:third_person_masculine_description] = translate(field_value_params[:description], :third_singular_masculine)
      field_value_params[:third_person_masculine_display_value] = translate(field_value_params[:display_value], :third_singular_masculine)

      @field_value = @field_template.field_values.new(field_value_params)
      set_conjugated_values(@field_value)
      if @field_value.save
        redirect_to [:admin, @field_template, @field_value], notice: t('admin.field_values.created')
      else
        respond_to do |format|
          format.html { render :new, layout: 'admin' }
        end
      end
    end

    def update
      set_conjugated_values(@field_value)
      if @field_value.update(field_value_params)
        respond_to do |format|
          format.html { redirect_to [:admin, @field_template, @field_value], notice: t('admin.field_values.updated') }
        end
      else
        respond_to do |format|
          format.html { render :edit, layout: 'admin' }
        end
      end
    end

    def destroy
      @field_value.destroy
      respond_to do |format|
        format.html { redirect_to admin_field_values_path(@field_template), notice: t('admin.field_values.destroyed') }
      end
    end

    private

    def field_template
      @field_template ||= FieldTemplate.find(params[:field_template_id])
    end

    def field_template=(field_template)
      @field_template ||= field_template || FieldTemplate.find(params[:field_template_id])
    end

    def field_value
      @field_value ||= @field_template.field_values.find(params[:id])
    end

    def field_value=(field_value)
      @field_value || field_value || @field_template.field_values.find(params[:id])
    end

    def ensure_field_template
      @field_template ||= FieldTemplate.find(params[:field_template_id])
    end

    def ensure_field_value
      @field_value ||= field_template.field_values.find(params[:id])
    end

    def field_value_params
      params.permit(:value, :display_value, :description, :default, :order)
    end

    def set_conjugated_values(field_value) # rubocop:disable Naming/AccessorMethodName
      field_value.first_person_singular_description = translate(field_value.description, :first_singular)
      field_value.first_person_singular_display_value = translate(field_value.display_value, :first_singular)
      field_value.second_person_singular_description = translate(field_value.description, :second_singular)
      field_value.second_person_singular_display_value = translate(field_value.display_value, :second_singular)
      field_value.third_person_masculine_description = translate(field_value.description, :third_singular_masculine)
      field_value.third_person_masculine_display_value = translate(field_value.display_value, :third_singular_masculine)
    end
  end
end
