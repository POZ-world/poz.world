# frozen_string_literal: true

class FieldsPolicy < ApplicationPolicy
  def index?
    current_account.role.can?(:manage_fields)
  end

  def create?
    current_account.role.can?(:manage_fields)
  end

  def update?
    current_account.role.can?(:manage_fields)
  end

  def destroy?
    current_account.role.can?(:manage_fields)
  end

  def edit?
    current_account.role.can?(:manage_fields)
  end
end
