module SpacesHelper
  def space_list_without_current(current_space)
    current_user.spaces.reject { |space| space.name == current_space }
  end
end
