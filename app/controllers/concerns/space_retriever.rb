class SpaceRetriever

  def initialize space_id
    @space_id = space_id
  end

  def space_name
    space.name
  end

  def space_description
    space.description
  end

  def group_titles
    map_group_attribute :title
  end

  def group_descriptions
    map_group_attribute :description
  end

  private

  def space
    @space ||= Space.find(@space_id)
  end

  def map_group_attribute attribute
    groups.map(&attribute)
  end

  def groups
    @groups ||= space.groups
  end

end
