# frozen_string_literal: true

class FaqPolicy < ApplicationPolicy
  def index?
    current_account.role.can?(:manage_faqs)
  end

  def create?
    current_account.role.can?(:manage_faqs)
  end

  def update?
    current_account.role.can?(:manage_faqs)
  end

  def destroy?
    current_account.role.can?(:manage_faqs)
  end

  def edit?
    current_account.role.can?(:manage_faqs)
  end

  def swap_positions?
    current_account.role.can?(:manage_faqs)
  end
end
