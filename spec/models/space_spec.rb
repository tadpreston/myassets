require 'rails_helper'

RSpec.describe Space, type: :model do
  it do
    should have_db_column(:user_id).of_type(:integer)
    should have_db_column(:name).of_type(:string)
    should have_db_column(:description).of_type(:text)
  end

  it { should belong_to(:user) }

  it { should validate_presence_of(:name) }
end
