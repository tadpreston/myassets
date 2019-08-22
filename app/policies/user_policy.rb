class UserPolicy < ApplicationPolicy
  def show?
    user_record_is_current_user?
  end

  def update?
    user_record_is_current_user?
  end

  def edit?
    user_record_is_current_user?
  end

  def destroy?
    user_record_is_current_user?
  end

  private

  def user_record_is_current_user?
    record.id == user.id
  end
end
