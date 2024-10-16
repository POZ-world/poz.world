# frozen_string_literal: true

class LinksPolicy < ApplicationPolicy
  def index?
    current_account.role.can?(:manage_links)
  end

  def create?
    current_account.role.can?(:manage_links)
  end

  def update?
    current_account.role.can?(:manage_links)
  end

  def destroy?
    current_account.role.can?(:manage_links)
  end

  def edit?
    current_account.role.can?(:manage_links)
  end
end
