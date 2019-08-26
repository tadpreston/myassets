require 'rails_helper'

RSpec.describe List, type: :model do
  it do
    should have_db_column(:group_id).of_type(:integer)
    should have_db_column(:title).of_type(:string)
    should have_db_column(:description).of_type(:text)
  end

  it { should belong_to(:group) }

  it {should validate_presence_of(:title) }
end
