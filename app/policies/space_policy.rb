class SpacePolicy < ApplicationPolicy
  def show?
    space_record_belongs_to_user?
  end

  def update?
    space_record_belongs_to_user?
  end

  def edit?
    space_record_belongs_to_user?
  end

  def destroy?
    space_record_belongs_to_user?
  end

  class Scope < Scope
    def resolve
      scope.where(user_id: user.id)
    end
  end

  private

  def space_record_belongs_to_user?
    record.user_id == user.id
  end
end
