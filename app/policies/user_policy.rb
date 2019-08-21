class UserPolicy < ApplicationPolicy
  def show?
    user_record_is_current_record?
  end

  def update?
    user_record_is_current_record?
  end

  def edit?
    user_record_is_current_record?
  end

  def destroy?
    user_record_is_current_record?
  end

  private

  def user_record_is_current_record?
    record.id == user.id
  end
end
